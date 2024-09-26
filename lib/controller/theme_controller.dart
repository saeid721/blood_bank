// import 'package:get/get.dart';
//
// class ThemeController extends GetxController implements GetxService {
//   SharedPreferences? prefs;
//   ThemeController({this.prefs});
//
//   @override
//   onInit() async {
//     super.onInit();
//     await _loadCurrentTheme();
//     update();
//   }
//
//   bool _darkTheme = false;
//   bool get themeValue => _darkTheme;
//
//   void toggleDartTheme(){
//     _darkTheme = true;
//     locator<MyPrefs>().settBool(key: PrefsKeys.theme, value: _darkTheme);
//     update();
//   }
//
//   void toggleLightTheme(){
//     _darkTheme = false;
//     locator<MyPrefs>().settBool(key: PrefsKeys.theme, value: _darkTheme);
//     update();
//   }
//
//   void toggleTheme() {
//     _darkTheme = !_darkTheme;
//     locator<MyPrefs>().settBool(key: PrefsKeys.theme, value: _darkTheme);
//     update();
//   }
//
//   Future<void> _loadCurrentTheme() async {
//     _darkTheme = await locator<MyPrefs>().gettBool(key: PrefsKeys.theme);
//     update();
//   }
// }
