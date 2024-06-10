import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:routing/core/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:routing/features/settings/data/models/user_model.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userName = FirebaseAuth.instance.currentUser!.email;

    if (userName == null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            "home",
          ),
        ),
        body: const Center(
          child: Text("No user is signed in"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home),
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('userName', isEqualTo: userName)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.hasError) {
            return const Text("Something went wrong !!!");
          } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return const Text("No data");
          } else {
            Map<String, dynamic> mp =
                snapshot.data!.docs.first.data() as Map<String, dynamic>;
            UserModel user = UserModel.fromMap(mp);

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: user.books.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () => AutoRouter.of(context).push(BookOpenRoute(
                            bookName: user.books[index].bookDescription)),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Text(" ${user.books[index].bookName}"),
                            ),
                            Divider()
                          ],
                        ),
                      );

                      // );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: user.authors.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () => AutoRouter.of(context).push(
                            AuthorOpenRoute(
                                authorName:
                                    user.authors[index].authorDescription)),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Text(user.authors[index].authorName),
                            ),
                            Divider()
                          ],
                        ),
                      );

                      // );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
      // body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      //   switch (state.runtimeType) {
      //     case UserDataState:
      //       final myState = state as UserDataState;
      //       if (state.userModel.books.isEmpty &&
      //           state.userModel.authors.isEmpty) {
      //         return Text("No Data");
      //       }
      // return Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         shrinkWrap: true,
      //         itemCount: myState.userModel.books.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             onTap: () => AutoRouter.of(context).push(BookOpenRoute(
      //                 bookName: myState
      //                     .userModel.books[index].bookDescription)),
      //             title: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Padding(
      //                   padding:
      //                       const EdgeInsets.symmetric(horizontal: 14),
      //                   child: Text(
      //                       " ${myState.userModel.books[index].bookName}"),
      //                 ),
      //                 Divider()
      //               ],
      //             ),
      //           );

      //           // );
      //         },
      //       ),
      //     ),
      //     Expanded(
      //       child: ListView.builder(
      //         shrinkWrap: true,
      //         itemCount: myState.userModel.authors.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             onTap: () => AutoRouter.of(context).push(
      //                 AuthorOpenRoute(
      //                     authorName: myState.userModel.authors[index]
      //                         .authorDescription)),
      //             title: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Padding(
      //                   padding:
      //                       const EdgeInsets.symmetric(horizontal: 14),
      //                   child: Text(
      //                       myState.userModel.authors[index].authorName),
      //                 ),
      //                 Divider()
      //               ],
      //             ),
      //           );

      //           // );
      //         },
      //       ),
      //     ),
      //   ],
      // );

      //     default:
      //       return Text("No Data");
      //   }
      // }),
    );
  }
}
