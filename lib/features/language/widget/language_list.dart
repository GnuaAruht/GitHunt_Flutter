part of '../language_filter_bottom_sheet.dart';

class _LanguageListWidget extends StatelessWidget {
  final ScrollController controller;

  const _LanguageListWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {

    final languages = context.select<LanguageProvider, List<Language>>(
        (provider) => provider.languages);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: languages.isEmpty
          ? const _LanguageNotFound()
          : ListView.separated(
              controller: controller,
              itemCount: languages.length,
              separatorBuilder: (_, __) => Divider(
                thickness: 0.2,
                height: 0.0,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              itemBuilder: (context, index) {
                return _LanguageItemWidget(language: languages[index]);
              },
            ),
    );
  }
}

class _LanguageItemWidget extends StatelessWidget {
  final Language language;

  const _LanguageItemWidget({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).pop(language),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: defaultPadding * 1.5,
        vertical: 1.6,
      ),
      leading: language.colorCode != null
          ? CircleAvatar(
              radius: 8.0,
              backgroundColor: language.colorCode!.color,
            )
          : null,
      title: Text(language.title),
    );
  }
}
