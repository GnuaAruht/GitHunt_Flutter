import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/config/injector.dart';
import 'package:githunt_flutter/core/config/string_ext.dart';
import 'package:provider/provider.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';
import 'package:githunt_flutter/core/model/language_model.dart';
import 'package:githunt_flutter/features/language/provider/language_provider.dart';

part 'widget/search.dart';
part 'widget/language_list.dart';
part 'widget/filter_title.dart';
part 'widget/language_not_found.dart';

const _maxExtent = 0.95;

class LanguageFilterBottomSheet extends StatefulWidget {

  static Future<Language?> show(BuildContext context) {
    return showModalBottomSheet<Language>(
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

  void onScrollUpdate() {
    final focusScopeNode = FocusScope.of(context);
    if(focusScopeNode.hasFocus) {
      focusScopeNode.unfocus();
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
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              onScrollUpdate();
            }
            return true;
          },
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              _FilterTitleWidget(onClosePressed: onClosePressed),
              const SizedBox(height: 10.0),
              _SearchWidget(onTap: onSearchTapped),
              const SizedBox(height: 10.0),
              Expanded(child: _LanguageListWidget(controller: scrollController))
            ],
          ),
        );
      },
    );
  }
}
