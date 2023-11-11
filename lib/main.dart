import 'package:amazon_clone/routes.dart';
import 'package:flutter/material.dart';
import 'Features/auth/screen/auth_screen.dart';
import 'constants/global_variable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(),
        primaryColor: GlobalVariables.secondaryColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      title: 'A m a z o n',
      onGenerateRoute: (settings) => Generate_Route(settings),
      home: const Authscreen(),
    );
  }
}
