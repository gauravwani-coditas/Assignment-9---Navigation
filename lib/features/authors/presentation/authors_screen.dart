import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:routing/core/routes/app_routes.dart';
import 'package:routing/features/authors/data/data_source/data_source.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


@RoutePage()
class AuthorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title:  Text(AppLocalizations.of(context)!.authors),
        ),
        body: Column(
          children: [
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: authorsDataSource.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => AutoRouter.of(context).push(AuthorOpenRoute(authorName: authorsDataSource[index],),),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Text(authorsDataSource[index]),
                        ),
                        const Divider()
                      ],
                    ),
                  );

                  // );
                },
              ),
            ),
            
          ],
        ));
  }
}




