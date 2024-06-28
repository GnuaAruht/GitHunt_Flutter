import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:githunt_flutter/core/const/api_const.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';
import 'package:githunt_flutter/core/config/date_filter.dart';
import 'package:githunt_flutter/features/language/language_filter_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void showTokenAlertBanner(BuildContext context) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        leading: const Icon(Icons.info_outline_rounded,color: Colors.white),
        content: const Text(_tokenAlertMessage),
        contentTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 16.0,
        ),
        backgroundColor: const Color(0xFFF1B00A),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              _EnterTokenDialog.show(context);
              // todo save entered token and dismiss the banner
            },
            child: const Text(
              'ADD TOKEN',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text(
              'DISMISS',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
