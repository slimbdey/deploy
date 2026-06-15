import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @addIngredients.
  ///
  /// In ru, this message translates to:
  /// **'Добавить'**
  String get addIngredients;

  /// No description provided for @addRecipePhoto.
  ///
  /// In ru, this message translates to:
  /// **'Добавить фото рецепта'**
  String get addRecipePhoto;

  /// No description provided for @addStep.
  ///
  /// In ru, this message translates to:
  /// **'Добавить шаг'**
  String get addStep;

  /// No description provided for @aiRecognition.
  ///
  /// In ru, this message translates to:
  /// **'AI распознавание'**
  String get aiRecognition;

  /// No description provided for @appTitle.
  ///
  /// In ru, this message translates to:
  /// **'Книга рецептов'**
  String get appTitle;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @checkStock.
  ///
  /// In ru, this message translates to:
  /// **'Проверить наличие'**
  String get checkStock;

  /// No description provided for @clearHive.
  ///
  /// In ru, this message translates to:
  /// **'Очистить Hive'**
  String get clearHive;

  /// No description provided for @dataSaved.
  ///
  /// In ru, this message translates to:
  /// **'Данные сохранены!'**
  String get dataSaved;

  /// No description provided for @delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// No description provided for @favorites.
  ///
  /// In ru, this message translates to:
  /// **'Избранное'**
  String get favorites;

  /// No description provided for @fridge.
  ///
  /// In ru, this message translates to:
  /// **'Холодильник'**
  String get fridge;

  /// No description provided for @fridgeContent.
  ///
  /// In ru, this message translates to:
  /// **'В холодильнике'**
  String get fridgeContent;

  /// No description provided for @ingredient.
  ///
  /// In ru, this message translates to:
  /// **'Ингредиент'**
  String get ingredient;

  /// No description provided for @ingredients.
  ///
  /// In ru, this message translates to:
  /// **'Ингредиенты'**
  String get ingredients;

  /// No description provided for @loadError.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка загрузки'**
  String get loadError;

  /// No description provided for @login.
  ///
  /// In ru, this message translates to:
  /// **'логин (email)'**
  String get login;

  /// No description provided for @loginAgain.
  ///
  /// In ru, this message translates to:
  /// **'логин еще раз'**
  String get loginAgain;

  /// No description provided for @loginFailed.
  ///
  /// In ru, this message translates to:
  /// **'неверный логин или пароль'**
  String get loginFailed;

  /// No description provided for @loginRequired.
  ///
  /// In ru, this message translates to:
  /// **'логин обязателен'**
  String get loginRequired;

  /// No description provided for @makePhoto.
  ///
  /// In ru, this message translates to:
  /// **'Сфотографировать'**
  String get makePhoto;

  /// No description provided for @minutes.
  ///
  /// In ru, this message translates to:
  /// **'Минуты'**
  String get minutes;

  /// No description provided for @newRecipe.
  ///
  /// In ru, this message translates to:
  /// **'Новый рецепт'**
  String get newRecipe;

  /// No description provided for @noIngredients.
  ///
  /// In ru, this message translates to:
  /// **'Нет ингредиентов'**
  String get noIngredients;

  /// No description provided for @noInternet.
  ///
  /// In ru, this message translates to:
  /// **'отсутствует интернет...'**
  String get noInternet;

  /// No description provided for @noRecipes.
  ///
  /// In ru, this message translates to:
  /// **'Нет рецептов'**
  String get noRecipes;

  /// No description provided for @noSteps.
  ///
  /// In ru, this message translates to:
  /// **'Нет шагов приготовления'**
  String get noSteps;

  /// No description provided for @password.
  ///
  /// In ru, this message translates to:
  /// **'пароль'**
  String get password;

  /// No description provided for @passwordAgain.
  ///
  /// In ru, this message translates to:
  /// **'пароль еще раз'**
  String get passwordAgain;

  /// No description provided for @passwordRequired.
  ///
  /// In ru, this message translates to:
  /// **'пароль обязателен'**
  String get passwordRequired;

  /// No description provided for @passwordAgainRequired.
  ///
  /// In ru, this message translates to:
  /// **'пароль обязателен'**
  String get passwordAgainRequired;

  /// No description provided for @passwordTooShort.
  ///
  /// In ru, this message translates to:
  /// **'минимум 6 символов'**
  String get passwordTooShort;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In ru, this message translates to:
  /// **'пароли не совпадают'**
  String get passwordsDoNotMatch;

  /// No description provided for @pickFromAlbum.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать из альбома'**
  String get pickFromAlbum;

  /// No description provided for @pickFromUrl.
  ///
  /// In ru, this message translates to:
  /// **'Вставить ссылку'**
  String get pickFromUrl;

  /// No description provided for @productsLoadError.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось загрузить продукты: {error}'**
  String productsLoadError(Object error);

  /// No description provided for @profile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile;

  /// No description provided for @readHive.
  ///
  /// In ru, this message translates to:
  /// **'Прочитать Hive'**
  String get readHive;

  /// No description provided for @recipe.
  ///
  /// In ru, this message translates to:
  /// **'Рецепт'**
  String get recipe;

  /// No description provided for @recipeNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Рецепт не найден'**
  String get recipeNotFound;

  /// No description provided for @recipeStep.
  ///
  /// In ru, this message translates to:
  /// **'Шаг рецепта'**
  String get recipeStep;

  /// No description provided for @recipes.
  ///
  /// In ru, this message translates to:
  /// **'Рецепты'**
  String get recipes;

  /// No description provided for @registerFailed.
  ///
  /// In ru, this message translates to:
  /// **'регистрация не удалась'**
  String get registerFailed;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @saveRecipe.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить рецепт'**
  String get saveRecipe;

  /// No description provided for @seconds.
  ///
  /// In ru, this message translates to:
  /// **'Секунды'**
  String get seconds;

  /// No description provided for @signIn.
  ///
  /// In ru, this message translates to:
  /// **'войти'**
  String get signIn;

  /// No description provided for @signInCaption.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get signInCaption;

  /// No description provided for @signInLabel.
  ///
  /// In ru, this message translates to:
  /// **'войти в приложение'**
  String get signInLabel;

  /// No description provided for @signOut.
  ///
  /// In ru, this message translates to:
  /// **'выйти'**
  String get signOut;

  /// No description provided for @signUp.
  ///
  /// In ru, this message translates to:
  /// **'регистрация'**
  String get signUp;

  /// No description provided for @signUpLabel.
  ///
  /// In ru, this message translates to:
  /// **'зарегистрироваться'**
  String get signUpLabel;

  /// No description provided for @startCooking.
  ///
  /// In ru, this message translates to:
  /// **'Начать готовить'**
  String get startCooking;

  /// No description provided for @stepDescription.
  ///
  /// In ru, this message translates to:
  /// **'Описание шага'**
  String get stepDescription;

  /// No description provided for @stepDuration.
  ///
  /// In ru, this message translates to:
  /// **'Длительность шага'**
  String get stepDuration;

  /// No description provided for @steps.
  ///
  /// In ru, this message translates to:
  /// **'Шаги приготовления'**
  String get steps;

  /// No description provided for @stopCooking.
  ///
  /// In ru, this message translates to:
  /// **'Закончить готовить'**
  String get stopCooking;

  /// No description provided for @suggestRecipes.
  ///
  /// In ru, this message translates to:
  /// **'Рекомендовать'**
  String get suggestRecipes;

  /// No description provided for @unknownCommentState.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка состояния комментария'**
  String get unknownCommentState;

  /// No description provided for @url.
  ///
  /// In ru, this message translates to:
  /// **'Ссылка'**
  String get url;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
