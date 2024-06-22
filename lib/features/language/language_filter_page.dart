import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/config/ui_state.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';
import 'package:githunt_flutter/core/model/language_model.dart';
import 'package:githunt_flutter/features/language/language_provider.dart';
import 'package:githunt_flutter/features/widget/loading_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

part 'widget/search_widget.dart';

class LanguageFilterPage extends StatelessWidget {
  const LanguageFilterPage({super.key});

  @override
  Widget build(BuildContext context) {

    final uiState = context
        .select<LanguageProvider, UIState>((provider) => provider.uiState);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Language'),
        centerTitle: true,
        elevation: 4.0,
        bottom: _SearchWidget(),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: uiState.whenOrNull(
                success: () => const _LanguageListWidget(),
                error: (msg) => Center(child: Text(msg))) ??
            const Center(child: LoadingWidget()),
      ),
    );
  }
}

class _LanguageListWidget extends StatelessWidget {
  const _LanguageListWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final languages = context.select<LanguageProvider, List<LanguageModel>>(
        (provider) => provider.languages);

    return ListView.separated(
      itemCount: languages.length,
      separatorBuilder: (_, __) => const Divider(
        thickness: 0.4,
        height: 0.0,
      ),
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
      onTap: () => context.pop(language),
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
