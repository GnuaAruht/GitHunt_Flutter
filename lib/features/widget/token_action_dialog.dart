import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';

enum TokenAction {
  update(
    icon: Icons.edit,
    title: 'Update token',
  ),
  clear(
    icon: Icons.clear,
    title: 'Clear token',
  );

  final String title;
  final IconData icon;

  const TokenAction({required this.icon, required this.title});
}

class TokenActionDialog extends StatelessWidget {

  static Future<TokenAction?> show() async {
    return SmartDialog.show<TokenAction>(
        builder: (_) => const TokenActionDialog());
  }

  const TokenActionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.86,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal access token',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: defaultPadding),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: TokenAction.values.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(height: 4.0),
            itemBuilder: (context, index) {
              final action = TokenAction.values[index];
              return ListTile(
                onTap: () => SmartDialog.dismiss(result: action),
                leading: Icon(action.icon),
                title: Text(action.title),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () => SmartDialog.dismiss(),
              child: Text(
                'CANCEL',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
