import 'package:flutter/material.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';
import 'package:go_router/go_router.dart';

part './widget/theme_change_bottom_sheet.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          _buildChangeThemeTile(context),
          _buildTokenTile(),
          const Spacer(),
          const Center(child: Text('v 1.0.0')),
          const SizedBox(height: defaultPadding * 3)
        ],
      ),
    );
  }

  ListTile _buildTokenTile() {
    return ListTile(
      onTap: () {},
      title: const Text('Update token'),
      subtitle: const Text('Tap to update the token'),
    );
  }

  Widget _buildChangeThemeTile(BuildContext context) {
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

}
