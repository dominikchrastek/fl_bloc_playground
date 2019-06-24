import 'package:flutter/material.dart';
import './router.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Router router = new Router();

    return MaterialApp(
      title: "Stuff",
      onGenerateRoute: router.routes,
    );
  }
}
