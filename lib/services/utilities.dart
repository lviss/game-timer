import 'dart:math';

class Utilities {
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static const _upper_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const _number_chars = '1234567890';
  static Random _rnd = Random();

  static String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  static String getRandomUppercaseString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _upper_chars.codeUnitAt(_rnd.nextInt(_upper_chars.length))));

  static String getRandomNumberString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _number_chars.codeUnitAt(_rnd.nextInt(_number_chars.length))));
}