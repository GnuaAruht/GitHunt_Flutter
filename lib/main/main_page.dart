import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:githunt_flutter/const/ui_constants.dart';

part 'widget/app_bar.dart';

part 'widget/repo_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: _RepoListWidget(),
    );
  }
}
