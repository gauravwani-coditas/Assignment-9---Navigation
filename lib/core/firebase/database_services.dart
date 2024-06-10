import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:routing/features/settings/data/models/user_model.dart';

class DatabaseService {
  late CollectionReference userReference;
  String? userName;

  DatabaseService() {
    userReference = FirebaseFirestore.instance.collection('users');
  }

  Stream<QuerySnapshot> fetchUsers() {
    try {
      userName = FirebaseAuth.instance.currentUser!.email;

      if (userName == null) {
        throw Exception("User not logged in");
      }
      return userReference.where('userName', isEqualTo: userName).snapshots();
    } catch (e) {
      print("error fetching response");
      throw Exception();
    }
  }

  Future<void> registerUser(UserModel userModel) async {
    try {
      await userReference.add(userModel.toMap());
    } catch (e) {
      print("error in user registration");
    }
  }
}
