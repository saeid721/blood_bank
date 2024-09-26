import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/language_data_model.dart';
import 'model/language_list_model.dart';

class LanguageController extends GetxController implements GetxService {
  final SharedPreferences prefs;
  LanguageController({required this.prefs});

  int _selectIndex = 0;
  int get selectIndex => _selectIndex;

  void setSelectIndex(int index) {
    _selectIndex = index;
    update();
  }

  List<LanguageModel> _languages = [];
  List<LanguageModel> get languages => _languages;

  void searchLanguage(String query, BuildContext context) {
    if (query.isEmpty) {
      _languages.clear();
      _languages = LanguageListModel.languages;
      update();
    } else {
      _selectIndex = -1;
      _languages = [];
      // ignore: avoid_function_literals_in_foreach_calls
      LanguageListModel.languages.forEach((product) async {
        if (product.languageName!.toLowerCase().contains(query.toLowerCase())) {
          _languages.add(product);
        }
      });
      update();
    }
  }

  void initializeAllLanguages(BuildContext context) {
    if (_languages.isEmpty) {
      _languages.clear();
      _languages = LanguageListModel.languages;
    }
    update();
  }
}
