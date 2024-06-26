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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Form(
            key: _formKey,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Token length - 40',
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
          ),
        ),
        const SizedBox(width: 4.0),
        TextButton(
          onPressed: _onGenerateToken,
          child: const Text('Generate'),
        )
      ],
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
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        const SizedBox(width: defaultPadding),
        TextButton(
          onPressed: _onSubmitToken,
          child: const Text('Add'),
        ),
      ],
    );
  }

  void _onGenerateToken() {
    // todo navigate to token generate web page
  }

  void _onSubmitToken() {
    if(_formKey.currentState!.validate()) {
      Navigator.of(context).pop(_token);
    }
  }

}
