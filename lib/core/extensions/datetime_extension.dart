import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDateString([String separator = '.']) => DateFormat("dd${separator}MM${separator}yyyy", "tr").format(this);
  String toTimeString() => DateFormat("HH:mm", "tr").format(this);
  String toLongTimeString() => DateFormat("HH:mm:ss", "tr").format(this);
  String toDateTimeString([String pattern = 'dd MMM yyyy HH:mm', String? locale]) => DateFormat(pattern, locale).format(this);
}
