part of '../main_page.dart';

const _tokenAlertMessage =
    "Generate a token and add it to avoid hitting the rate limit.";

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
          vertical: 4.0,
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
            Icon(Icons.close, color: Colors.white),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.close,color: Colors.white,size: 10.0),
            // )
          ],
        ),
        // child: Text(
        //   _tokenAlertMessage,
        //   style: TextStyle(color: Colors.white),
        // ),
      ),
    );
  }
}
