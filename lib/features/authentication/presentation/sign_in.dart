import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:routing/core/di/di.dart';
import 'package:routing/core/routes/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routing/core/utils/constants.dart';
import 'package:routing/core/firebase/auth.dart';
import 'package:routing/features/settings/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  TextEditingController userNameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 128,
              child: SizedBox(),
            ),
            SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                    "assets/images/splash_screen_images/coditas_icon.svg")),
            const Expanded(flex: 264, child: SizedBox()),
            Text(
              "UserName",
              style:
                  GoogleFonts.heebo(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            const Expanded(
              flex: 4,
              child: SizedBox(),
            ),
            TextField(
              controller: userNameEditingController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(133, 144, 162, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 20,
              child: SizedBox(),
            ),
            Text(
              "Password",
              style:
                  GoogleFonts.heebo(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            const Expanded(
              flex: 4,
              child: SizedBox(),
            ),
            TextField(
              controller: passwordEditingController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(133, 144, 162, 1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 36,
              child: SizedBox(),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  String userName =
                      userNameEditingController.text.toString().trim();
                  String password =
                      passwordEditingController.text.toString().trim();

                  if (userName.isNotEmpty && password.isNotEmpty) {
                    final message = await locator<Auth>()
                        .login(email: userName, password: password);

                    if (message == 'Success') {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool(Constants.KEY_LOGIN, true);
                      context.read<UserBloc>().add(UserDataEvent());

                      FirebaseAnalytics.instance.logEvent(name: "Sign In ");

                      AutoRouter.of(context)
                          .replaceAll([const CustomNavRoute()]);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Invalid Credentials !!")));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Please fill the credentials !")));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(65, 82, 180, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Sign In"),
              ),
            ),
            const Expanded(
              flex: 16,
              child: SizedBox(),
            ),
            Container(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(const SignUpRoute());
                    },
                    child: Text(
                      "Don’t have an account yet? Sign up",
                      style: GoogleFonts.heebo(
                          fontWeight: FontWeight.w400, fontSize: 16),
                    ))),
            const Expanded(flex: 276, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
