part of '../language_filter_bottom_sheet.dart';

class _SearchWidget extends StatelessWidget {

  final VoidCallback onTap;

  const _SearchWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {

    final uiState = context
        .select<LanguageProvider, UIState>((provider) => provider.uiState);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: 4.0,
      ),
      child: TextField(
        enabled: uiState is UIStateSuccess,
        onTap: onTap,
        onChanged: (value) {
          context.read<LanguageProvider>().searchLanguage(value ?? '');
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search,color: Colors.grey),
          hintText: 'Filter Languages',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
      ),
    );
  }

}
