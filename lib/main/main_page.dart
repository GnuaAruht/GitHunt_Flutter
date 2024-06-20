import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:githunt_flutter/config/date_filter.dart';
import 'package:githunt_flutter/const/route_const.dart';
import 'package:githunt_flutter/const/ui_const.dart';
import 'package:go_router/go_router.dart';

part 'widget/app_bar.dart';

part 'widget/repo_list.dart';

part 'widget/filter_menu.dart';

part 'widget/reload_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const _FilterMenu(),
            const SizedBox(height: defaultPadding),
            const _RepoListWidget(),
            const SizedBox(height: defaultPadding),
            _ReloadButton(onPressed: () {}),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
