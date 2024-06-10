part of 'locale_bloc.dart';

@immutable
sealed class LocaleEvent {}

class OnLocaleChangedEvent extends LocaleEvent {
  OnLocaleChangedEvent({required this.locale});
  Locale locale;
}
