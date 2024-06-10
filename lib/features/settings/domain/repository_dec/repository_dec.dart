import 'package:routing/features/settings/data/models/user_model.dart';

abstract class SettingsRepositoryDec {
  Future<UserModel> getUserData();
}
