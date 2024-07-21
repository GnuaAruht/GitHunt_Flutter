part of '../main_page.dart';

const _tokenAlertMessage =
    "Generate a token and add it to avoid hitting the rate limit.";

class _TokenAlertWidget extends StatelessWidget {
  const _TokenAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        EnterTokenDialog.show(isAdd: false).then((token) {
          if (token != null) {
            context.read<PATProvider>().addToken(token);
          }
        });
      },
      child: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.secondaryContainer,
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: 8.0,
        ),
        child: Row(
          children: [
            const Icon(Icons.info_outline, color: Colors.white),
            const SizedBox(width: defaultPadding / 2),
            const Expanded(
              child: Text(
                _tokenAlertMessage,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: defaultPadding / 2),
            GestureDetector(
              onTap: () => context.read<PATProvider>().markBannerClosed(),
              child: const Icon(Icons.close, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
