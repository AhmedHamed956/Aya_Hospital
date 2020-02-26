import 'package:flutter/cupertino.dart';

class AppConfig extends ChangeNotifier {
  String _currentLang = 'ar';
  String get currenLang => _currentLang;
  set currenLang(String value) {
    _currentLang = value;
    notifyListeners();
  }

  bool _isDark = false;
  bool get isDark => _isDark;
  set isDark(bool value) {
    _isDark = value;
    notifyListeners();
  }
}
