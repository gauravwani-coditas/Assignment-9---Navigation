import 'package:routing/core/di/di.dart';
import 'package:routing/features/settings/data/models/user_model.dart';
import 'package:routing/features/settings/data/repository_def/repository_def.dart';

class UserUsecase {
  Future<UserModel> getUserUseCase() async {
    UserModel user = await locator<SettingsRepositoryDef>().getUserData();

    return user;
  }
}
