part of '../language_filter_page.dart';

class _SearchWidget extends StatelessWidget implements PreferredSizeWidget {
  static const _searchHeight = 58.0;

  @override
  Widget build(BuildContext context) {

    final uiState = context
        .select<LanguageProvider, UIState>((provider) => provider.uiState);

    return Container(
      width: double.infinity,
      height: _searchHeight,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: 4.0,
      ),
      child: TextField(
        enabled: uiState is UIStateSuccess,
        onChanged: (value) {
          context.read<LanguageProvider>().searchLanguage(value ?? '');
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Filter Languages',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_searchHeight);
}
