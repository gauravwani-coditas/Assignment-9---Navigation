import 'package:get_it/get_it.dart';
import 'package:routing/core/firebase/database_services.dart';
import 'package:routing/core/firebase/auth.dart';
import 'package:routing/core/firebase/notifications.dart';
import 'package:routing/features/settings/data/data_source/data_source.dart';
import 'package:routing/features/settings/data/repository_def/repository_def.dart';
import 'package:routing/features/settings/domain/repository_dec/repository_dec.dart';
import 'package:routing/features/settings/domain/usecase/user_usecase.dart';

final locator = GetIt.instance;

void setDi() {
  locator.registerSingleton<Auth>(Auth());
  locator.registerSingleton<DatabaseService>(DatabaseService());
  locator.registerSingleton<UserDataSource>(UserDataSource());
  locator.registerSingleton<SettingsRepositoryDef>(SettingsRepositoryDef());
  locator.registerSingleton<UserUsecase>(UserUsecase());
  locator.registerSingleton<PushNotifications>(PushNotifications());
}
