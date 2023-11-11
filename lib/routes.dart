// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'Features/auth/screen/auth_screen.dart';

Route<dynamic> Generate_Route(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Authscreen.routName:
      return MaterialPageRoute(
        builder: (_) => const Authscreen(),
        settings: routeSettings,
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
            body: Center(
          child: Text('Screen does not exist'),
        )),
      );
  }
}
