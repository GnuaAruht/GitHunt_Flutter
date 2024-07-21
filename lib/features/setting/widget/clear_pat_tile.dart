part of '../settings_page.dart';

class _ClearPATTile extends StatelessWidget {
  const _ClearPATTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        TokenClearConfirmDialog.show().then((confirmed) {
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

