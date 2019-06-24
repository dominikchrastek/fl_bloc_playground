import 'package:fl_bloc_playground/src/repository/terminal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './activation/activation_screen.dart';
import './activation/activation_bloc.dart';

class Router {
  final TerminalRepository terminalRepository = new TerminalRepository();

  Route screenActivation() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return BlocProvider<ActivationBloc>(
            builder: (context) =>
                ActivationBloc(terminalRepository: terminalRepository),
            child: ActivationScreen());
      },
    );
  }

  Route screenLogin() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return ActivationScreen();
      },
    );
  }

  Route routes(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case "/":
        return screenActivation();
      case "/login":
        return screenLogin();

      default:
        return screenActivation();
    }
  }
}
