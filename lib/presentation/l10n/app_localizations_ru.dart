// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get addIngredients => 'Добавить';

  @override
  String get addRecipePhoto => 'Добавить фото рецепта';

  @override
  String get addStep => 'Добавить шаг';

  @override
  String get aiRecognition => 'AI распознавание';

  @override
  String get appTitle => 'Книга рецептов';

  @override
  String get cancel => 'Отмена';

  @override
  String get checkStock => 'Проверить наличие';

  @override
  String get clearHive => 'Очистить Hive';

  @override
  String get dataSaved => 'Данные сохранены!';

  @override
  String get delete => 'Удалить';

  @override
  String get favorites => 'Избранное';

  @override
  String get fridge => 'Холодильник';

  @override
  String get fridgeContent => 'В холодильнике';

  @override
  String get ingredient => 'Ингредиент';

  @override
  String get ingredients => 'Ингредиенты';

  @override
  String get loadError => 'Ошибка загрузки';

  @override
  String get login => 'логин (email)';

  @override
  String get loginAgain => 'логин еще раз';

  @override
  String get loginFailed => 'неверный логин или пароль';

  @override
  String get loginRequired => 'логин обязателен';

  @override
  String get makePhoto => 'Сфотографировать';

  @override
  String get minutes => 'Минуты';

  @override
  String get newRecipe => 'Новый рецепт';

  @override
  String get noIngredients => 'Нет ингредиентов';

  @override
  String get noInternet => 'отсутствует интернет...';

  @override
  String get noRecipes => 'Нет рецептов';

  @override
  String get noSteps => 'Нет шагов приготовления';

  @override
  String get password => 'пароль';

  @override
  String get passwordAgain => 'пароль еще раз';

  @override
  String get passwordRequired => 'пароль обязателен';

  @override
  String get passwordAgainRequired => 'пароль обязателен';

  @override
  String get passwordTooShort => 'минимум 6 символов';

  @override
  String get passwordsDoNotMatch => 'пароли не совпадают';

  @override
  String get pickFromAlbum => 'Выбрать из альбома';

  @override
  String get pickFromUrl => 'Вставить ссылку';

  @override
  String productsLoadError(Object error) {
    return 'Не удалось загрузить продукты: $error';
  }

  @override
  String get profile => 'Профиль';

  @override
  String get readHive => 'Прочитать Hive';

  @override
  String get recipe => 'Рецепт';

  @override
  String get recipeNotFound => 'Рецепт не найден';

  @override
  String get recipeStep => 'Шаг рецепта';

  @override
  String get recipes => 'Рецепты';

  @override
  String get registerFailed => 'регистрация не удалась';

  @override
  String get save => 'Сохранить';

  @override
  String get saveRecipe => 'Сохранить рецепт';

  @override
  String get seconds => 'Секунды';

  @override
  String get signIn => 'войти';

  @override
  String get signInCaption => 'Войти';

  @override
  String get signInLabel => 'войти в приложение';

  @override
  String get signOut => 'выйти';

  @override
  String get signUp => 'регистрация';

  @override
  String get signUpLabel => 'зарегистрироваться';

  @override
  String get startCooking => 'Начать готовить';

  @override
  String get stepDescription => 'Описание шага';

  @override
  String get stepDuration => 'Длительность шага';

  @override
  String get steps => 'Шаги приготовления';

  @override
  String get stopCooking => 'Закончить готовить';

  @override
  String get suggestRecipes => 'Рекомендовать';

  @override
  String get unknownCommentState => 'Ошибка состояния комментария';

  @override
  String get url => 'Ссылка';
}
