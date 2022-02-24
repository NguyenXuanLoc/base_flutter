import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
// bool searchInString(String? source, String? search) {
//   if (source == null || source.isEmpty) {
//     return false;
//   }
//   if (search == null || search.isEmpty) {
//     return true;
//   }
//   final strSource = TiengViet.parse(source).toLowerCase();
//   final strSearch = TiengViet.parse(search).toLowerCase();
//   return strSource.contains(strSearch);
// }

String numberFormat(int num) {
  final formatter = NumberFormat("#,###");
  return formatter.format(num);
}

String stringTimeFormat(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? DateFormat('dd/MM/yyyy').format(date) : '';
}

String fullStringTimeFormat(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null
      ? DateFormat('dd/MM/yyyy HH:mm')
          .format(date.add(const Duration(hours: 7)))
      : '';
}

DateTime? string2Date(String? stringTime) {
  return DateTime.tryParse(stringTime ?? '');
}

String stringTimeFormatLongDuration(int days, String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null
      ? DateFormat('dd/MM/yyyy').format(date.add(Duration(days: days)))
      : '';
}

String stringTimeFormatYearDuration(int month, String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null
      ? Jiffy(date).add(months: month).format('dd/MM/yyyy')
      : '';
}

String formatLicensePlate(String licensePlate) {
  licensePlate = licensePlate.replaceAll("-", "");
  return licensePlate != ''
      ? (licensePlate.substring(0, 4) + '-' + licensePlate.substring(4))
      : '';
}

String getEndYear(int duration, String date) {
  var createyear = int.parse(fullStringTimeFormatYear(date));
  return ((createyear + (duration / 12))).toStringAsFixed(0);
}

String fullStringTimeFormatYear(String? stringTime) {
  final date = DateTime.tryParse(stringTime ?? '');
  return date != null ? DateFormat('yyyy').format(date) : '0';
}

String formatDateTimeFromString(String date, String month, String year) {
  var validDate = date;
  var validMonth = month;
  var validYear = year;
  switch (int.parse(validMonth)) {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
      if (int.parse(validDate) > 31) validDate = "31";
      break;
    case 2:
      if (checkYear(int.parse(year))) {
        if (int.parse(validDate) > 29) validDate = "29";
      } else {
        if (int.parse(validDate) > 28) validDate = "28";
      }
      break;
    default:
      if (int.parse(validDate) > 30) validDate = "30";
      break;
  }
  if (int.parse(validMonth) > 12) validMonth = "12";
  return "$validDate/$validMonth/$validYear";
}

bool checkYear(int year) {
  return (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0));
}

bool checkFormat(String regex, String checkedString) {
  return RegExp(regex).hasMatch(checkedString);
}
