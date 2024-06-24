part of '../language_filter_bottom_sheet.dart';

class _LanguageNotFound extends StatelessWidget {
  const _LanguageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        height: 100.0,
        alignment: Alignment.center,
        child: const Text('Language not found.'),
      ),
    );
  }

}
