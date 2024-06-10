import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:routing/core/di/di.dart';
import 'package:routing/core/firebase/database_services.dart';
import 'package:routing/features/settings/data/models/user_model.dart';

class UserDataSource {
  Future<UserModel> getUserDataSource() async {
    Stream<QuerySnapshot> snapshot = locator<DatabaseService>().fetchUsers();

    Map<String, dynamic> mp = snapshot.first as Map<String, dynamic>;

    UserModel user = UserModel.fromMap(mp);

    return user;
  }
}
