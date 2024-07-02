part of '../main_page.dart';

class _EnterTokenDialog extends StatefulWidget {
  const _EnterTokenDialog({super.key});

  static Future<String?> show(BuildContext context) {
    return SmartDialog.show<String>(builder: (_) => const _EnterTokenDialog());
  }

  @override
  State<_EnterTokenDialog> createState() => _EnterTokenDialogState();
}

class _EnterTokenDialogState extends State<_EnterTokenDialog> {

  final _formKey = GlobalKey<FormState>();
  String? _token;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.86,
      decoration: BoxDecoration(
        color: Colors.white,
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
              onTap: _onGenerateToken,
              child: const Text('Generate'),
            ),
          ),
          hintText: 'Your token',
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
      'Enter your token',
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: _onSubmitToken,
          child: const Text('ADD'),
        ),
        const SizedBox(width: defaultPadding / 2),
        TextButton(
          onPressed: () => SmartDialog.dismiss(),
          child: const Text('CANCEL',style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }

  void _onGenerateToken() async {
    if (!await launchUrl(Uri.parse(ApiConst.tokenGenerateUrl),
        mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch.');
    }
  }

  void _onSubmitToken() {
    if (_formKey.currentState!.validate()) {
      SmartDialog.dismiss(result: _token);
    }
  }
}
