import 'package:url_launcher/url_launcher.dart';

abstract class UrlUtil {
  static Future<void> launchUrlInApp(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch.');
    }
  }

}
