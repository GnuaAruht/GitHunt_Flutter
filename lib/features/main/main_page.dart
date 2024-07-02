import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:githunt_flutter/core/config/ui_state.dart';
import 'package:githunt_flutter/core/const/api_const.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';
import 'package:githunt_flutter/core/config/date_filter.dart';
import 'package:githunt_flutter/core/model/language_model.dart';
import 'package:githunt_flutter/core/model/repositories_data.dart';
import 'package:githunt_flutter/core/model/repository.dart';
import 'package:githunt_flutter/features/language/language_filter_bottom_sheet.dart';
import 'package:githunt_flutter/features/main/provider/main_provider.dart';
import 'package:githunt_flutter/features/widget/loading_widget.dart';

part 'widget/app_bar.dart';
part 'widget/repo_list.dart';
part 'widget/filter_menu.dart';
part 'widget/reload_button.dart';
part 'widget/repositories_data.dart';
part 'widget/list_status.dart';
part 'widget/enter_token_dialog.dart';
part 'widget/token_alert.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    context.select<MainProvider, bool>((provider) => provider.firstLoading);
    final uiState = context.read<MainProvider>().uiState;

    return Scaffold(
      appBar: const _AppBar(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: uiState.whenOrNull(
                success: () => _buildSuccess(),
                loading: () => _buildLoading(),
                error: (_) => _buildError()) ??
            const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildSuccess() {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          _FilterMenu(),
          SizedBox(height: defaultPadding * 1.5),
          _MainDataList(),
          _ListStatusWidget(),
          SizedBox(height: defaultPadding),
        ],
      ),
    );
  }

  Widget _buildLoading() => Center(child: LoadingWidget.medium());

  Widget _buildError() => const Center(child: Text('Data loading error'));

  void showTokenAlertBanner(BuildContext context) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        leading: const Icon(Icons.info_outline_rounded, color: Colors.white),
        content: const Text(_tokenAlertMessage),
        contentTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 16.0,
        ),
        backgroundColor: const Color(0xFFF1B00A),
        actions: <Widget>[
          TextButton(
            onPressed: () => onAddToken(context),
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

  void onAddToken(BuildContext context) {
    _EnterTokenDialog.show(context).then((token) {
      if (token != null) {
        context.read<MainProvider>().saveGithubToken(token).whenComplete(() {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        });
      }
    });
  }

}

class _MainDataList extends StatelessWidget {
  const _MainDataList({super.key});

  @override
  Widget build(BuildContext context) {

    final dataList = context.select<MainProvider, List<RepositoriesData>>(
        (provider) => provider.repositoriesData);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: dataList.isNotEmpty
          ? _buildDataList(dataList)
          : const Center(child: Text('No data list')),
    );
  }

  Widget _buildDataList(List<RepositoriesData> repoDataList) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: repoDataList.length,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: defaultPadding * 2),
      itemBuilder: (context, index) {
        final data = repoDataList[index];
        return _RepositoriesData(data: data);
      },
    );
  }

}
