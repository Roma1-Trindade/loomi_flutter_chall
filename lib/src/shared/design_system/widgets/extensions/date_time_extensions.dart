import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get toMMDDYYYY => DateFormat('MM/dd/yyyy').format(this);
  String get toyyyyMMdd => DateFormat('yyyy-MM-dd').format(this);
  String get toyMMMdHm =>
      '${DateFormat('yMMMd').format(this)} at ${DateFormat('Hm').format(this)}';
  String get toyMMMdyyyy => DateFormat('MMM d, yyyy').format(this);
  String get toPayDate => DateFormat('MM-dd-yyyy').format(this);
}
