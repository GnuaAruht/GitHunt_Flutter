import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';
import 'package:githunt_flutter/core/config/date_filter.dart';
import 'package:githunt_flutter/features/language/language_filter_bottom_sheet.dart';

part 'widget/app_bar.dart';

part 'widget/repo_list.dart';

part 'widget/filter_menu.dart';

part 'widget/reload_button.dart';

part 'widget/repos_content.dart';

part 'widget/list_status.dart';

part 'widget/enter_token_dialog.dart';

part 'widget/token_alert.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            _TokenAlertWidget(),
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  _FilterMenu(),
                  SizedBox(height: defaultPadding * 1.5),
                  _ReposContent(),
                  SizedBox(height: defaultPadding * 2),
                  _ReposContent(),
                  SizedBox(height: defaultPadding * 2),
                  _ListStatusWidget(),
                ],
              ),
            ),
            SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}



