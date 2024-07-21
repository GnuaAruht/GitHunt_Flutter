part of '../main_page.dart';

class _ErrorContent extends StatelessWidget {
  final Error error;
  bool get isUnAuthorized => error.isUnAuthorized;

  const _ErrorContent({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isUnAuthorized
              ? const Text('Your token might have expired.')
              : Text(error.message),
          const SizedBox(height: defaultPadding),
          _buildButton(context)
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _onButtonPressed(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding * 0.8,
          vertical: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: getBoxShadow(context),
        ),
        child: Text(
          isUnAuthorized ? 'Update token' : 'Refresh',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _onButtonPressed(BuildContext context) {
    if (isUnAuthorized) {
      _showTokenActionDialog(context);
    } else {
      context.read<MainProvider>().reloadData();
    }
  }

  void _showTokenActionDialog(BuildContext context) {
    TokenActionDialog.show().then(
      (action) {
        if (action != null) {
          switch (action) {
            case TokenAction.update:
              _onTokenUpdate(context);
            case TokenAction.clear:
              _onTokenClear(context);
          }
        }
      },
    );
  }

  void _onTokenUpdate(BuildContext context) {
    EnterTokenDialog.show(isAdd: true).then(
      (token) {
        if (token != null) {
          // update token and refresh data list
          context.read<PATProvider>().addToken(token).whenComplete(() {
            context.read<MainProvider>().reloadData();
          });
        }
      },
    );
  }

  void _onTokenClear(BuildContext context) {
    TokenClearConfirmDialog.show().then(
      (confirm) {
        if (confirm ?? false) {
          // clear token and refresh data list
          context.read<PATProvider>().clearToken().whenComplete(() {
            context.read<MainProvider>().reloadData();
          });
        }
      },
    );
  }
}
