import 'package:fl_bloc_playground/src/activation/activation_event.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import './activation_bloc.dart';
import './activation_state.dart';
import '../components/loading.dart';

class ActivationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activationBloc = BlocProvider.of<ActivationBloc>(context);

    return BlocListener(
        bloc: activationBloc,
        listener: (BuildContext context, ActivationState state) {
          print(state);

          if (state is ActivationStateLoading) {
            return Loading();
          }
          if (state is ActivationStateActivated) {
            Navigator.of(context).pushNamed('/login');
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Activation"),
          ),
          body: BlocBuilder(
              bloc: activationBloc,
              builder: (BuildContext context, ActivationState state) {
                if (state is ActivationStateInit) {
                  activationBloc.dispatch(ActivationEventInit());
                }
                if (state is ActivationStateLoading) {
                  return Loading();
                }
                return buildBody(context, activationBloc, state);
              }),
        ));
  }

  String getErrorText(ActivationState state) {
    if (state is ActivationStateError) {
      return state.error;
    }
    return null;
  }

  Widget buildBody(
      BuildContext context, ActivationBloc bloc, ActivationState state) {
    return Center(
      child: Column(
        children: <Widget>[
          fieldPin(state),
          submitButton(context, bloc),
        ],
      ),
    );
  }

  Widget fieldPin(ActivationState state) {
    return TextField(
      maxLength: 6,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: "Pin",
          labelText: "Pin",
          errorText: this.getErrorText(state)),
    );
  }

  Widget submitButton(BuildContext context, ActivationBloc bloc) {
    return RaisedButton(
      onPressed: () {
        bloc.dispatch(ActivationEventActivate(pin: '913827'));
      },
      child: Text('Activate'),
      color: Colors.blue,
    );
  }
}
