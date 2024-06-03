import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:routing/core/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class CustomNavBar extends StatelessWidget{
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {

    return AutoTabsRouter(

      routes: const [
        HomeRoute(),
        AuthorsRoute(),
        BooksRoute(),
        SettingsRoute(),
      ],

      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(  
          body: child,
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
             
              onTap: (value) {
                tabsRouter.setActiveIndex(value);
              },
              items:  [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: AppLocalizations.of(context)!.home),
                BottomNavigationBarItem(icon: Icon(Icons.person,),label: AppLocalizations.of(context)!.authors),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections_bookmark_rounded),label: AppLocalizations.of(context)!.books),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: AppLocalizations.of(context)!.settings),
              ],
              
              ),
        );
      },
    );
  }

}

