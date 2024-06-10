import 'package:routing/core/di/di.dart';
import 'package:routing/features/settings/data/data_source/data_source.dart';
import 'package:routing/features/settings/data/models/user_model.dart';
import 'package:routing/features/settings/domain/repository_dec/repository_dec.dart';

class SettingsRepositoryDef implements SettingsRepositoryDec {
  @override
  Future<UserModel> getUserData() async {
    UserModel user = await locator<UserDataSource>().getUserDataSource();
    ;
    return user;
  }
}
