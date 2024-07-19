import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';
import 'package:githunt_flutter/features/widget/enter_token_dialog.dart';
import 'package:githunt_flutter/pat_provider.dart';
import 'package:githunt_flutter/theme_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

part './widget/theme_change_bottom_sheet.dart';
part './widget/change_theme_tile.dart';
part './widget/pat_action_tile.dart';
part './widget/clear_pat_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          const _ChangeThemeTile(),
          const _PATActionTile(),
          _buildClearTokenTile(),
          const Spacer(),
          Center(child: _buildVersion()),
          const SizedBox(height: defaultPadding * 3)
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back),
      ),
      title: const Text('Settings'),
    );
  }

  Widget _buildClearTokenTile() {
    return Selector<PATProvider, bool>(
      selector: (_, provider) => provider.tokenAdded,
      builder: (_, added, __) {
        return added ? const _ClearPATTile() : const SizedBox.shrink();
      },
    );
  }

  Widget _buildVersion() {
    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Failed to get version.');
        } else if (snapshot.hasData) {
          final packageInfo = snapshot.data!;
          return Text('V ${packageInfo.version}');
        }
        return const SizedBox.shrink();
      },
    );
  }
}
