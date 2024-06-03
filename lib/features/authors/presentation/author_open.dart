import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthorOpen extends StatelessWidget{
  
  String authorName;
  AuthorOpen({required this.authorName, super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(authorName),),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
          
              const Expanded(flex: 63, child: SizedBox()),
              Text("$authorName description"),
              const Expanded(flex: 650, child: SizedBox()),
            ],
          ),
        ),
    );
  }
}