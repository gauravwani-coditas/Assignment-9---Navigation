import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:routing/core/routes/app_routes.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:routing/features/settings/data/models/user_model.dart';

@RoutePage()
class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userName = FirebaseAuth.instance.currentUser!.email;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.books),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('userName', isEqualTo: userName)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (!snapshot.hasData || snapshot.hasError) {
            return const Text("Something went wrong !!!");
          } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return const Text("No data");
          } else {
            Map<String, dynamic> mp =
                snapshot.data!.docs.first.data() as Map<String, dynamic>;

            UserModel user = UserModel.fromMap(mp);

            return Container(
              height: 500,
              child: ListView.builder(
                itemCount: user.books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => AutoRouter.of(context).push(
                      BookOpenRoute(
                          bookName: user.books[index].bookDescription),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Text("${user.books[index].bookName}"),
                        ),
                        Divider()
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
