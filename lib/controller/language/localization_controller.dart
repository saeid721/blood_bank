// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'model/language_list_model.dart';
//
// class LocalizationController extends GetxController implements GetxService {
//   final SharedPreferences prefs;
//
//   LocalizationController({required this.prefs}) {
//     loadCurrentLanguage();
//   }
//
//   Locale _locale = Locale(LanguageListModel.languages[0].languageCode!,
//       LanguageListModel.languages[0].countryCode);
//   bool _isLtr = true;
//   Locale get locale => _locale;
//   bool get isLtr => _isLtr;
//
//   void setLanguage(Locale locale) {
//     Get.updateLocale(locale);
//     _locale = locale;
//     if (_locale.languageCode == 'ar') {
//       _isLtr = false;
//     } else {
//       _isLtr = true;
//     }
//     saveLanguage(_locale);
//     update();
//   }
//
//   void loadCurrentLanguage() async {
//     _locale = Locale(
//         locator<MyPrefs>().gettString(key: PrefsKeys.langCode)
//         ?? LanguageListModel.languages[0].languageCode!,
//         locator<MyPrefs>().gettString(key: PrefsKeys.countryCode)
//         ?? LanguageListModel.languages[0].countryCode);
//     _isLtr = _locale.languageCode != 'ar';
//     update();
//   }
//
//   void saveLanguage(Locale locale) async {
//     locator<MyPrefs>().settString(
//         key: PrefsKeys.langCode,
//         value: locale.languageCode
//     );
//
//     locator<MyPrefs>().settString(
//         key: PrefsKeys.countryCode,
//         value: locale.countryCode
//     );
//   }
//
// }
