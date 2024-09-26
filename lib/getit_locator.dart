// //
// import 'package:get/get.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'controller/language/localization_controller.dart';
// import 'controller/theme_controller.dart';
//
// final locator =  GetIt.instance;
//
// Future init(SharedPreferences prefs) async {
//
//   //Map<String, Map<String, String>> languages = await languageinit();
//   locator.registerLazySingleton<MyPrefs>(()=> MyPrefs());
//   locator.registerLazySingleton<ThemeController>(() => ThemeController());
//   locator.registerLazySingleton<NotificationController>(() => NotificationController(prefs: prefs));
//
//
//   Get.put(AuthController());
//   // Get.put(ThemeController(prefs: prefs));
//   // Get.put(NotificationController(prefs: prefs));
//
//   Get.lazyPut(() => ThemeController(prefs: prefs));
//   Get.lazyPut(() => LocalizationController(prefs: prefs));
//   Get.lazyPut(() => LanguageController(prefs: prefs));
//   Get.lazyPut(() => NotificationController(prefs: prefs));
// }
