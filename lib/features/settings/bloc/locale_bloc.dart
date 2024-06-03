import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(CurrentLocaleState(locale: const Locale('en'))) {
   on<OnLocaleChangedEvent>(onLocaleChangedEvent);
  }

  FutureOr<void> onLocaleChangedEvent(OnLocaleChangedEvent event, Emitter<LocaleState> emit) {
    emit(CurrentLocaleState(locale: event.locale));
  }
}
