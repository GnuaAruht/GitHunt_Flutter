part of '../language_filter_bottom_sheet.dart';

class _LanguageListWidget extends StatelessWidget {
  final ScrollController controller;
  const _LanguageListWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {

    final languages = context.select<LanguageProvider, List<LanguageModel>>(
        (provider) => provider.languages);

    return ListView.separated(
      controller: controller,
      itemCount: languages.length,
      separatorBuilder: (_, __) => const Divider(thickness: 0.4, height: 0.0),
      itemBuilder: (context, index) {
        return _LanguageItemWidget(language: languages[index]);
      },
    );

  }
}

class _LanguageItemWidget extends StatelessWidget {

  final LanguageModel language;
  const _LanguageItemWidget({super.key, required this.language});

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: () => Navigator.of(context).pop(language),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: defaultPadding * 1.5,
        vertical: 4.0,
      ),
      leading: language.color != null
          ? CircleAvatar(radius: 8.0, backgroundColor: language.color!)
          : null,
      title: Text(language.name),
    );

  }

}
