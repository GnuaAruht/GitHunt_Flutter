import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';
import 'package:githunt_flutter/features/widget/enter_token_dialog.dart';
import 'package:githunt_flutter/theme_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

part './widget/theme_change_bottom_sheet.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildChangeThemeTile(context),
          _buildTokenTile(context),
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

  Widget _buildChangeThemeTile(BuildContext context) {
    return ListTile(
      onTap: () {
        _ThemeChangeBottomSheet.show(context).then((mode) {
          if (mode != null) {
            context.read<ThemeProvider>().changeTheme(mode);
          }
        });
      },
      title: const Text('Change theme'),
      subtitle: const Text('Tap to change the theme'),
    );
  }

  Widget _buildTokenTile(BuildContext context) {
    return ListTile(
      onTap: () {
        EnterTokenDialog.show(context).then((token) {
          if (token != null) {
            // todo save token
          }
        });
      },
      title: const Text('Update token'),
      subtitle: const Text('Tap to update the token'),
    );
  }

}
