import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:routing/core/di/di.dart';
import 'package:routing/features/settings/data/models/user_model.dart';
import 'package:routing/features/settings/domain/usecase/user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserDataEvent>(userDataEvent);
  }

  FutureOr<void> userDataEvent(
      UserDataEvent event, Emitter<UserState> emit) async {
    UserModel user = await locator<UserUsecase>().getUserUseCase();
    emit(UserDataState(userModel: user));
  }
}
