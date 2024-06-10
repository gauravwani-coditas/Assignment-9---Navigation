part of 'user_bloc.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

class UserDataState extends UserState {
  UserModel userModel;

  UserDataState({required this.userModel});
}
