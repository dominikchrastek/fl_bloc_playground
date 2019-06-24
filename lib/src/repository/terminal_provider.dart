import 'dart:async';

import '../model/terminal.dart';

class TerminalProvider {
  Future<Terminal> activate(String pin) async {
    final parsedJson = {};
    final error = parsedJson['error'];

    if (error != null) {
      // TODO: check how to propperly handle errors
      throw new Exception(error);
    }

    print(parsedJson);
    return Terminal.fromJson(parsedJson);
  }
}
