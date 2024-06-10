// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthorOpenRoute.name: (routeData) {
      final args = routeData.argsAs<AuthorOpenArgs>();
      return AutoRoutePage<dynamic>(
          routeData: routeData, child: AuthorOpen(authorName: args.authorName));
    },
    AuthorsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthorsScreen(),
      );
    },
    BookOpenRoute.name: (routeData) {
      final args = routeData.argsAs<BookOpenArgs>();
      return AutoRoutePage<dynamic>(
          routeData: routeData, child: BookOpen(bookName: args.bookName));
    },
    BooksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BooksScreen(),
      );
    },
    CustomNavRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomNavBar(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(),
      );
    },
    OnBoardingRoute1.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OnBoardingScreen1(),
      );
    },
    OnBoardingRoute2.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OnBoardingScreen2(),
      );
    },
    OnBoardingRoute3.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OnBoardingScreen3(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignUpScreen(),
      );
    },
  };
}

/// generated route for
/// [AuthorOpen]
class AuthorOpenRoute extends PageRouteInfo<AuthorOpenArgs> {
  AuthorOpenRoute({
    required String authorName,
    List<PageRouteInfo>? children,
  }) : super(
          AuthorOpenRoute.name,
          args: AuthorOpenArgs(
            authorName: authorName,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthorOpen';

  static const PageInfo<AuthorOpenArgs> page = PageInfo<AuthorOpenArgs>(name);
}

class AuthorOpenArgs {
  const AuthorOpenArgs({
    required this.authorName,
  });

  final String authorName;

  @override
  String toString() {
    return 'AuthorOpenArgs{authorName: $authorName}';
  }
}

/// generated route for
/// [AuthorsScreen]
class AuthorsRoute extends PageRouteInfo<void> {
  const AuthorsRoute({List<PageRouteInfo>? children})
      : super(
          AuthorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthorsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookOpen]
class BookOpenRoute extends PageRouteInfo<BookOpenArgs> {
  BookOpenRoute({
    required String bookName,
    List<PageRouteInfo>? children,
  }) : super(
          BookOpenRoute.name,
          args: BookOpenArgs(
            bookName: bookName,
          ),
          initialChildren: children,
        );

  static const String name = 'BookOpen';

  static const PageInfo<BookOpenArgs> page = PageInfo<BookOpenArgs>(name);
}

class BookOpenArgs {
  const BookOpenArgs({
    required this.bookName,
  });

  final String bookName;

  @override
  String toString() {
    return 'BookOpenArgs{bookName: $bookName}';
  }
}

/// generated route for
/// [BooksScreen]
class BooksRoute extends PageRouteInfo<void> {
  const BooksRoute({List<PageRouteInfo>? children})
      : super(
          BooksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BooksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomNavBar]
class CustomNavRoute extends PageRouteInfo<void> {
  const CustomNavRoute({List<PageRouteInfo>? children})
      : super(
          CustomNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomNavBar';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnBoardingScreen1]
class OnBoardingRoute1 extends PageRouteInfo<void> {
  const OnBoardingRoute1({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute1.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute1';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnBoardingScreen2]
class OnBoardingRoute2 extends PageRouteInfo<void> {
  const OnBoardingRoute2({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute2.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute2';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnBoardingScreen3]
class OnBoardingRoute3 extends PageRouteInfo<void> {
  const OnBoardingRoute3({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute3.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute3';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
