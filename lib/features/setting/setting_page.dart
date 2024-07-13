import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';
import 'package:githunt_flutter/features/widget/enter_token_dialog.dart';
import 'package:go_router/go_router.dart';

part './widget/theme_change_bottom_sheet.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildChangeThemeTile(context),
          _buildTokenTile(context),
          const Spacer(),
          const Center(child: Text('v 1.0.0')),
          const SizedBox(height: defaultPadding * 3)
        ],
      ),
    );
  }

  Widget _buildChangeThemeTile(BuildContext context) {

    MediaQuery.of(context).platformBrightness;

    return ListTile(
      onTap: () {
        _ThemeChangeBottomSheet.show(context).then((mode) {
          if (mode != null) {
            // todo change theme mode
          }
        });
      },
      title: const Text('Change theme'),
      subtitle: const Text('Tap to change the theme'),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(Icons.arrow_back),
      ),
      centerTitle: true,
      title: const Text('Settings'),
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
