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
import 'package:githunt_flutter/core/model/language_model.dart';
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
        ) ?? const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          // todo check if token is already added
          const _TokenAlertWidget(),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                const _FilterMenu(),
                const SizedBox(height: defaultPadding * 1.5),
                const _MainDataList(),
                _buildListStatus(),
                const SizedBox(height: defaultPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListStatus() {
    return Selector<MainProvider, bool>(
      selector: (_, provider) => provider.repositoriesData.isEmpty,
      child: const _ListStatusWidget(),
      builder: (context, isEmpty, child) {
        return isEmpty ? const SizedBox.shrink() : child!;
      },
    );
  }

  Widget _buildLoading() => Center(child: LoadingWidget.medium());

  Widget _buildError() => const Center(child: Text('Data loading error.'));

}

// void _showTokenAlertBanner(BuildContext context) {
//   ScaffoldMessenger.of(context).showMaterialBanner(
//     MaterialBanner(
//       leading: const Icon(Icons.info_outline_rounded, color: Colors.white),
//       content: const Text(_tokenAlertMessage),
//       contentTextStyle: const TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.normal,
//         fontSize: 16.0,
//       ),
//       backgroundColor: const Color(0xFFF1B00A),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () => _onAddToken(context),
//           child: const Text(
//             'ADD TOKEN',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
//           },
//           child: const Text(
//             'DISMISS',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     ),
//       // Banner(
//       //   message: 'This is a banner',
//       //   location: BannerLocation.bottomEnd,
//       // )
//   );
// }
//
// void _onAddToken(BuildContext context) {
//   EnterTokenDialog.show(context).then((token) {
//     if (token != null) {
//       context.read<MainProvider>().saveGithubToken(token).whenComplete(() {
//         ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
//       });
//     }
//   });
// }
