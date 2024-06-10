import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BookOpen extends StatelessWidget {
  String bookName;
  BookOpen({required this.bookName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookName),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            const Expanded(flex: 63, child: SizedBox()),
            Text("$bookName "),
            const Expanded(flex: 650, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
