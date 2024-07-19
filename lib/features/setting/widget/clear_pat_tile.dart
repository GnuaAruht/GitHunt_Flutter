part of '../settings_page.dart';

class _ClearPATTile extends StatelessWidget {
  const _ClearPATTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _ConfirmDialog.show().then((confirmed) {
          if (confirmed ?? false) {
            context.read<PATProvider>().clearToken();
          }
        });
      },
      title: const Text('Clear token'),
      subtitle: const Text('Clear personal access token'),
    );
  }
}

class _ConfirmDialog extends StatelessWidget {

  static Future<bool?> show() async {
    return SmartDialog.show(builder: (_) => const _ConfirmDialog());
  }

  const _ConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.86,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Confirm',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: defaultPadding),
          const Text('Are you sure to clear token?'),
          const SizedBox(height: defaultPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => SmartDialog.dismiss(result: true),
                child: Text(
                  'CLEAR',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
              const SizedBox(width: defaultPadding / 2),
              TextButton(
                onPressed: () => SmartDialog.dismiss(result: false),
                child: const Text('CANCEL'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
