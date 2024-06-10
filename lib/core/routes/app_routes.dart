import 'package:auto_route/auto_route.dart';
import 'package:routing/features/authentication/presentation/sign_in.dart';
import 'package:routing/features/authentication/presentation/sign_up.dart';
import 'package:routing/features/authors/presentation/author_open.dart';
import 'package:routing/features/authors/presentation/authors_screen.dart';
import 'package:routing/features/books/presentation/book_open.dart';
import 'package:routing/features/books/presentation/books_screen.dart';
import 'package:routing/features/home/presentation/home_screen.dart';
import 'package:routing/features/settings/presentation/settings_screen.dart';
import 'package:routing/features/home/widgets/custom_bottom_navbar.dart';
import 'package:routing/features/intro/presentation/screens/onboarding_screen_1.dart';
import 'package:routing/features/intro/presentation/screens/onboarding_screen_2.dart';
import 'package:routing/features/intro/presentation/screens/onboarding_screen_3.dart';

part 'app_routes.gr.dart';

bool? isLogin;

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final bool isLogin;
  AppRouter({required this.isLogin});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: CustomNavRoute.page,
          initial: isLogin,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: AuthorsRoute.page),
            AutoRoute(page: BooksRoute.page),
            AutoRoute(page: SettingsRoute.page),
          ],
        ),
        AutoRoute(
          page: OnBoardingRoute1.page,
          initial: !isLogin,
        ),
        AutoRoute(
          page: SignInRoute.page,
        ),
        
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: OnBoardingRoute2.page),
        AutoRoute(page: OnBoardingRoute3.page),
        AutoRoute(page: AuthorOpenRoute.page),
        AutoRoute(page: BookOpenRoute.page),
      ];
}
