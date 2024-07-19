part of '../settings_page.dart';

extension ThemeModeExt on ThemeMode {
  String get title {
    switch (this) {
      case ThemeMode.light:
        return "Light";
      case ThemeMode.dark:
        return "Dark";
      case ThemeMode.system:
        return "Follow system";
    }
  }
}

class _ThemeChangeBottomSheet extends StatefulWidget {
  static Future<ThemeMode?> show(BuildContext context) {
    return showModalBottomSheet<ThemeMode>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(defaultRadius),
        ),
      ),
      builder: (context) => const _ThemeChangeBottomSheet(),
    );
  }

  const _ThemeChangeBottomSheet({super.key});

  @override
  State<_ThemeChangeBottomSheet> createState() =>
      _ThemeChangeBottomSheetState();
}

class _ThemeChangeBottomSheetState extends State<_ThemeChangeBottomSheet> {
  late ThemeMode selectedThemeMode = context.read<ThemeProvider>().themeMode;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {},
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitleRow(context),
            ListView.separated(
              itemCount: ThemeMode.values.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              separatorBuilder: (_, __) => const SizedBox(height: 8.0),
              itemBuilder: (context, index) {
                final mode = ThemeMode.values[2 - index];
                return ListTile(
                  onTap: () => context.pop(mode),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),
                  title: Text(mode.title),
                  trailing: Radio(
                    value: mode,
                    groupValue: selectedThemeMode,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => selectedThemeMode = value);
                        context.pop(mode);
                      }
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: defaultPadding * 3)
          ],
        );
      },
    );
  }

  Widget _buildTitleRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding * 0.8,
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Change theme',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.close),
          )
        ],
      ),
    );
  }
}
