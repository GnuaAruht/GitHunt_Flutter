part of '../main_page.dart';

class _ReloadButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const _ReloadButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding * 0.8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        color: Colors.blue,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 1.4,
          ),
        ],
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.sync, color: Colors.white),
          SizedBox(width: 8.0),
          Text(
            'Reload next week',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
