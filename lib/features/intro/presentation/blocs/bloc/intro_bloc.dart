import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(SplashScreenState()) {
   on<SplashScreenEvent>(splashScreenEvent);
    
  }  

  FutureOr<void> splashScreenEvent(SplashScreenEvent event, Emitter<IntroState> emit) async{

    emit(SplashScreenState());
    await Future.delayed(const Duration(seconds: 3));
    emit(OnBoardingState());
    
  }
}
