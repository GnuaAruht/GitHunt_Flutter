part of '../main_page.dart';

class _TokenAlertWidget extends StatelessWidget {
  const _TokenAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _EnterTokenDialog.show(context),
      child: Container(
        width: double.infinity,
        color: const Color(0xFFF1B00A),
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8.0,
        ),
        child: const Text(
          "Generate a token and add it to avoid hitting the rate limit.",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
