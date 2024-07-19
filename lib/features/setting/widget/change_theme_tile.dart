part of '../settings_page.dart';

class _ChangeThemeTile extends StatelessWidget {
  const _ChangeThemeTile({super.key});

  @override
  Widget build(BuildContext context) {
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

}
