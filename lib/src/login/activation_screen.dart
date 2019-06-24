import 'package:fl_bloc_playground/src/activation/activation_state.dart';
import 'package:flutter/material.dart';

class ActivationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: buildBody(context));
  }

  String getErrorText(ActivationState state) {
    if (state is ActivationStateError) {
      return state.error;
    }
    return null;
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          fieldPin(),
          submitButton(context),
        ],
      ),
    );
  }

  Widget fieldPin() {
    return TextField(
        maxLength: 6,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(hintText: "Pin", labelText: "Pin"));
  }

  Widget submitButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child: Text('Activate'),
      color: Colors.blue,
    );
  }
}
