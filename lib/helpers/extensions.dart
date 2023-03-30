import 'package:intl/intl.dart';

extension StringExtension on String {
  bool isValidEmail() {
    final RegExp regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return regex.hasMatch(this);
  }
}

extension DateTimeExtension on DateTime {
  String formattedDateTime() {
    return DateFormat('dd/MM/yy HH:mm', 'pt-BR').format(this);
  }

  String formattedHour() {
    return DateFormat('HH:mm:ss', 'pt-BR').format(this);
  }
}
