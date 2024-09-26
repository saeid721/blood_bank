
import 'package:blood_bank/global/constants/images.dart';
import 'language_data_model.dart';

class LanguageListModel{ 

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: AllImages.us, languageName: 'ENGLISH', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: AllImages.us, languageName: 'বাংলা', countryCode: 'BD', languageCode: 'bn'),
    LanguageModel(imageUrl: AllImages.italy, languageName: 'ITALIANO', countryCode: 'IT', languageCode: 'it'),
    LanguageModel(imageUrl: AllImages.arabic, languageName: 'عربى', countryCode: 'SA', languageCode: 'ar'),
    LanguageModel(imageUrl: AllImages.spain, languageName: 'ESPAÑOL ', countryCode: 'ES', languageCode: 'es'),
    LanguageModel(imageUrl: AllImages.chinese, languageName: 'CHINESE', countryCode: 'CN', languageCode: 'zh'),
    LanguageModel(imageUrl: AllImages.india, languageName: 'हिंदी', countryCode: 'IN', languageCode: 'hi'),
    LanguageModel(imageUrl: AllImages.france, languageName: 'FRANÇAISE', countryCode: 'FR', languageCode: 'fr'),
    LanguageModel(imageUrl: AllImages.portugues, languageName: 'PORTUGUÊS', countryCode: 'PT', languageCode: 'pt'),
  ];
  }