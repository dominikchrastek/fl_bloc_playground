import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'activation_event.dart';
import 'activation_state.dart';
import '../repository/terminal_repository.dart';

import 'package:meta/meta.dart';

class ActivationBloc extends Bloc<ActivationEvent, ActivationState> {
  final TerminalRepository terminalRepository;

  ActivationBloc({@required this.terminalRepository})
      : assert(terminalRepository != null);

  @override
  ActivationState get initialState => ActivationStateInit();

  @override
  Stream<ActivationState> mapEventToState(ActivationEvent event) async* {
    if (event is ActivationEventInit) {
      final token = "123456";

      print(token);

      if (token != null) {
        yield ActivationStateActivated();
      } else {
        yield ActivationStateInit();
      }
    }
    if (event is ActivationEventActivate) {
      yield ActivationStateLoading();

      try {
        yield ActivationStateActivated();
      } catch (err) {
        yield ActivationStateError(error: err.toString());
      }
    }
  }
}
