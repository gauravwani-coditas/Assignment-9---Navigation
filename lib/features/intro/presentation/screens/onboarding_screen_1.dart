import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:routing/core/routes/app_routes.dart';

@RoutePage()
class OnBoardingScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          children: [
            const Expanded(flex: 19, child: SizedBox()),
            Container(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(const SignInRoute());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(65, 82, 180, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Skip"),
              ),
            ),
            const Expanded(flex: 62, child: SizedBox()),
            SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                    "assets/images/splash_screen_images/coditas_icon.svg")),
            const Expanded(flex: 28, child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(OnBoardingRoute2());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(65, 82, 180, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Next"),
            ),
            const Expanded(flex: 25, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
