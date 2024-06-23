import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/config/injector.dart';
import 'package:provider/provider.dart';
import 'package:githunt_flutter/core/config/ui_state.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';
import 'package:githunt_flutter/core/model/language_model.dart';
import 'package:githunt_flutter/features/language/provider/language_provider.dart';
import 'package:githunt_flutter/features/widget/loading_widget.dart';

part 'widget/search_widget.dart';

part 'widget/language_list_widget.dart';

part 'widget/filter_title_widget.dart';

const _maxExtent = 0.95;

class LanguageFilterBottomSheet extends StatefulWidget {

  static Future<LanguageModel?> show(BuildContext context) {
    return showModalBottomSheet<LanguageModel>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(defaultRadius),
        ),
      ),
      builder: (context) => ChangeNotifierProvider(
        create: (_) => LanguageProvider(repository: injector.get()),
        child: const LanguageFilterBottomSheet(),
      ),
    );
  }

  const LanguageFilterBottomSheet({super.key});

  @override
  State<LanguageFilterBottomSheet> createState() =>
      _LanguageFilterBottomSheetState();
}

class _LanguageFilterBottomSheetState extends State<LanguageFilterBottomSheet> {

  late final DraggableScrollableController draggableController;

  @override
  void initState() {
    draggableController = DraggableScrollableController();
    super.initState();
  }

  @override
  void dispose() {
    draggableController.dispose();
    super.dispose();
  }

  void onClosePressed() => Navigator.of(context).pop();

  void onSearchTapped() {
    if (draggableController.size <= _maxExtent) {
      draggableController.animateTo(
        _maxExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      controller: draggableController,
      minChildSize: 0.35,
      maxChildSize: _maxExtent,
      builder: (context, scrollController) {
        return Column(
          children: [
            const SizedBox(height: 10.0),
            _FilterTitleWidget(onClosePressed: onClosePressed),
            const SizedBox(height: 10.0),
            _SearchWidget(onTap: onSearchTapped),
            const SizedBox(height: 10.0),
            Expanded(child: _FilterContent(controller: scrollController))
          ],
        );
      },
    );
  }
}

///

class _FilterContent extends StatelessWidget {

  final ScrollController controller;

  const _FilterContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {

    final uiState = context
        .select<LanguageProvider, UIState>((provider) => provider.uiState);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: uiState.whenOrNull(
              success: () => _LanguageListWidget(controller: controller),
              error: (msg) => Center(child: Text(msg))) ??
          const Center(child: LoadingWidget()),
    );

  }

}
