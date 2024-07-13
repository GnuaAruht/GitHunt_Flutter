part of '../main_page.dart';

const _tokenAlertMessage =
    "Generate a token and add it to avoid hitting the rate limit.";

// const _tokenAlertMessage =
//     "Add a token to avoid hitting the rate limit.";

class _TokenAlertWidget extends StatelessWidget {
  const _TokenAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => EnterTokenDialog.show(context),
      child: Container(
        width: double.infinity,
        color: const Color(0xFFF1B00A),
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: 6.0,
        ),
        child: const Row(
          children: [
            Expanded(
              child: Text(
                _tokenAlertMessage,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: defaultPadding / 2),
            Icon(Icons.close, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
