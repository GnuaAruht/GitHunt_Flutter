part of '../main_page.dart';

class _ListStatusWidget extends StatelessWidget {
  const _ListStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<MainProvider, UIState>(
      selector: (_, provider) => provider.uiState,
      builder: (_, uiState, __) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: uiState.whenOrNull(
                success: () => _ReloadButton(
                  onPressed: () => context.read<MainProvider>().reloadData(),
                ),
              ) ??
              LoadingWidget.small(),
        );
      },
    );
  }
}
