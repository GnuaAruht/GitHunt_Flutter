part of '../language_filter_bottom_sheet.dart';

class _FilterTitleWidget extends StatelessWidget {
  final VoidCallback onClosePressed;
  const _FilterTitleWidget({super.key, required this.onClosePressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Search Language',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            onPressed: onClosePressed,
            icon: const Icon(Icons.close),
          )
        ],
      ),
    );
  }
}
