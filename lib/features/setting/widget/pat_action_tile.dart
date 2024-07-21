part of '../settings_page.dart';

class _PATActionTile extends StatelessWidget {
  const _PATActionTile({super.key});

  @override
  Widget build(BuildContext context) {

    final tokenAdded =
        context.select<PATProvider, bool>((provider) => provider.tokenAdded);

    return ListTile(
      onTap: () {
        EnterTokenDialog.show(isAdd: tokenAdded).then((token) {
          if (token != null) {
            context.read<PATProvider>().addToken(token);
          }
        });
      },
      title: Text('${tokenAdded ? 'Update' : 'Add'} token'),
      subtitle: Text('Tap to ${tokenAdded ? 'update' : 'add'} personal access token'),
    );
  }

}
