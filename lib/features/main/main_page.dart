import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:githunt_flutter/core/const/route_const.dart';
import 'package:githunt_flutter/features/widget/enter_token_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:githunt_flutter/core/config/date_util.dart';
import 'package:githunt_flutter/core/config/ui_state.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';
import 'package:githunt_flutter/core/config/date_filter.dart';
import 'package:githunt_flutter/core/model/repositories_data.dart';
import 'package:githunt_flutter/core/model/repository.dart';
import 'package:githunt_flutter/features/language/language_filter_bottom_sheet.dart';
import 'package:githunt_flutter/features/main/provider/main_provider.dart';
import 'package:githunt_flutter/features/widget/loading_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

part 'widget/app_bar.dart';
part 'widget/repo_list.dart';
part 'widget/filter_menu.dart';
part 'widget/reload_button.dart';
part 'widget/repositories_data.dart';
part 'widget/list_status.dart';
part 'widget/token_alert.dart';
part 'widget/data_list.dart';
part 'widget/repo_list_title.dart';

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
              success: () => _buildSuccess(context),
              loading: () => _buildLoading(),
              error: (_) => _buildError(),
            ) ??
            const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context) => const _SuccessContent();

  Widget _buildLoading() => Center(child: LoadingWidget.medium());

  Widget _buildError() => const Center(child: Text('Data loading error.'));
}
