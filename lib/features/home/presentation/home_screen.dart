import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:routing/core/routes/app_routes.dart';
import 'package:routing/features/authors/data/data_source/data_source.dart';
import 'package:routing/features/books/data/data%20source/data_source.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


@RoutePage()
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.home),
      ),
      body:Column(
          children: [

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: booksDataSource.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => AutoRouter.of(context).push(BookOpenRoute(bookName: booksDataSource[index])),
                    
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Text("${AppLocalizations.of(context)!.book} ${booksDataSource[index]}"),
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
                itemCount: authorsDataSource.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => AutoRouter.of(context).push(AuthorOpenRoute(authorName:authorsDataSource[index])),
                    
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Text(authorsDataSource[index]),
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
        ),
      
    );
  }
}
