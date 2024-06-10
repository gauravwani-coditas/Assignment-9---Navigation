part of 'locale_bloc.dart';

@immutable
sealed class LocaleState {}

class CurrentLocaleState extends LocaleState {
  CurrentLocaleState({required this.locale});
  Locale locale;
}
