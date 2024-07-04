import 'package:timeago/timeago.dart';

class CustomMessage implements LookupMessages {

  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => 'from now';
  @override
  String lessThanOneMinute(int seconds) => 'just now';
  @override
  String aboutAMinute(int minutes) => 'a minute ago';
  @override
  String minutes(int minutes) => '$minutes minutes ago';
  @override
  String aboutAnHour(int minutes) => 'an hour ago';
  @override
  String hours(int hours) => '$hours hours ago';

  ///

  @override
  String aDay(int hours) => 'Yesterday';

  @override
  String days(int days) => '$days days ago';

  @override
  String aboutAMonth(int days) => 'Last month';

  @override
  String months(int months) => '$months months ago';

  @override
  String aboutAYear(int year) => 'Last year';

  @override
  String years(int years) => '$years years ago';

  @override
  String wordSeparator() => ' ';
}
