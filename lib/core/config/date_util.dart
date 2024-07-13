

import 'package:intl/intl.dart';

extension DateUtilExt on DateTime {

  String toTitleFormat() {
    return DateFormat.yMMMd().format(this);
  }

  String toQuery() {
    return DateFormat("yyy-MM-dd").format(this);
  }

}