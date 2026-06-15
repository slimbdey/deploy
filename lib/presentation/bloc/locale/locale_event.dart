abstract class LocaleEvent {}

class ChangeLocaleEvent extends LocaleEvent {
  final String languageCode;

  ChangeLocaleEvent(this.languageCode);
}
