
import 'dart:convert';

import '../assets/data/strings.dart';

String formatCurrency(int number) {
  double processedCurrencyValue = number/100;
  String strNumber = "${processedCurrencyValue.toStringAsFixed(2)}";
  String formatted = "";
  for(var x=0;x<strNumber.length;++x) {
    formatted += strNumber[x];
    int wholeNumberLength = strNumber.split(".")[0].length;
    if(wholeNumberLength>(x+1) && (wholeNumberLength-(x+1)) % 3 == 0) {
      formatted += " ";
    }
  }
  return formatted;
}

String formatDatePlainFromUtcString(String dateTimeUtc) {
  return formatDatePlain(DateTime.parse(dateTimeUtc));
}

String formatDatePlain(DateTime dateTime) {
  return "${dateTime.year}-"
      "${getDoubleZero(dateTime.month)}-"
      "${getDoubleZero(dateTime.day)} "
      "${getDoubleZero(dateTime.hour)}:"
      "${getDoubleZero(dateTime.minute)}";
}

String formatDate(DateTime dateTime) {
  if(dateTime != null) {
    var months = dataStrings["formattingHelper"]!["months"]!.toList();
    return "${dateTime.year} ${getDoubleZero(dateTime.day)} "
        "${months[dateTime.month-1]}"
        " ${getDoubleZero(dateTime.hour)}:"
        "${getDoubleZero(dateTime.minute)}";
  }
  return "Date Not Specified";
}

String formatSpaceAtCapital(String text, {bool convertToLowercase = false, bool convertFirstCharToLowercase = false}) {
  String formatted = "";
  for (int index = 0;index < text.codeUnits.length; ++index) {
    String characterString = String.fromCharCode(text.codeUnits[index]);
    if (index != 0 && characterString == characterString.toUpperCase()) {
      formatted += " ";
    }
    if ((index == 0 && convertFirstCharToLowercase) ||
        (index != 0 && convertToLowercase)) {
      characterString = characterString.toLowerCase();
    }
    formatted += characterString;
  }
  return formatted;
}

String formatFirstLetterCapital(String text) {
  String formatted = text.toUpperCase().substring(0, 1);
  if (text.length > 1) {
    formatted = "$formatted${text.substring(1)}";
  }
  return formatted;
}

String getDoubleZero(int month) {
  String formatted = "";
  if(month<10) {
    formatted = "0";
  }
  formatted += "$month";
  return formatted;
}

int getDecimalPlaces(double number) {
  int decimals = 0;
  List<String> substr = number.toString().split('.');
  if (substr.length > 0) decimals = int.tryParse(substr[1]) ?? 0;
  return decimals;
}

int getDecimalPlaceLength(double number) {
  List<String> substr = number.toString().split('.');
  return substr.length;
}

Map<String, dynamic> parseJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  return payloadMap;
}

String decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}