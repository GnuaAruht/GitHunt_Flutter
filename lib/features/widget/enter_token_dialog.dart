import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:githunt_flutter/core/config/launch_url_util.dart';
import 'package:githunt_flutter/core/const/api_const.dart';
import 'package:githunt_flutter/core/const/ui_const.dart';

class EnterTokenDialog extends StatefulWidget {
  const EnterTokenDialog({super.key, required this.isAdd});

  static Future<String?> show(BuildContext context, bool isAdd) {
    return SmartDialog.show<String>(
        builder: (_) => EnterTokenDialog(isAdd: isAdd));
  }

  final bool isAdd;

  @override
  State<EnterTokenDialog> createState() => _EnterTokenDialogState();
}

class _EnterTokenDialogState extends State<EnterTokenDialog> {

  final _formKey = GlobalKey<FormState>();
  String? _token;

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
          _buildTitle(),
          const SizedBox(height: defaultPadding),
          _buildInputForm(),
          const SizedBox(height: defaultPadding / 2),
          _buildButtonRow(context),
        ],
      ),
    );
  }

  Widget _buildInputForm() {
    return Form(
      key: _formKey,
      child: TextFormField(
        decoration: InputDecoration(
          suffix: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: GestureDetector(
              onTap: () {
                UrlUtil.launchUrlInApp(Uri.parse(ApiConst.tokenGenerateUrl));
              },
              child: const Text('Generate'),
            ),
          ),
          // hintText: 'Your token',
          hintText: '${widget.isAdd ? 'Update' : 'Enter'} your token',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        onChanged: (value) => _token = value,
        validator: (value) {
          return (value == null || value.isEmpty || value.length != 40)
              ? "Please enter a valid token."
              : null;
        },
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Personal access token',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: _onSubmitToken,
          child: Text(widget.isAdd ? 'UPDATE' : 'ADD'),
        ),
        const SizedBox(width: defaultPadding / 2),
        TextButton(
          onPressed: () => SmartDialog.dismiss(),
          child: Text(
            'CANCEL',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ),
      ],
    );
  }

  void _onSubmitToken() {
    if (_formKey.currentState!.validate()) {
      SmartDialog.dismiss(result: _token);
    }
  }

}
