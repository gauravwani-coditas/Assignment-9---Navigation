part of 'intro_bloc.dart';

@immutable
sealed class IntroState {}

class SplashScreenState extends IntroState {}

class OnBoardingState extends IntroState {}
