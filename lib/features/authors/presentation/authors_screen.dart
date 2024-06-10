import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:routing/core/routes/app_routes.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:routing/features/settings/data/models/user_model.dart';

@RoutePage()
class AuthorsScreen extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    final userName = FirebaseAuth.instance.currentUser!.email;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.authors),
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
                itemCount: user.authors.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      analytics.logEvent(name: "Author selected", parameters: {
                        'author_name': user.authors[index].authorName
                        
                      });
                      AutoRouter.of(context).push(
                        AuthorOpenRoute(
                          authorName: user.authors[index].authorDescription,
                        ),
                      );
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Text(user.authors[index].authorName),
                        ),
                        const Divider()
                      ],
                    ),
                  );

                  // );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
