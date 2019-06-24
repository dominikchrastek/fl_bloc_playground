import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ActivationState extends Equatable {
  ActivationState([List props = const []]) : super(props);
}

class ActivationStateInit extends ActivationState {
  @override
  String toString() => 'ActivationStateInit';
}

class ActivationStateActivated extends ActivationState {
  @override
  String toString() => 'ActivationStateActivated';
}

class ActivationStateLoading extends ActivationState {
  @override
  String toString() => 'ActivationStateLoading';
}

class ActivationStateError extends ActivationState {
  final String error;

  ActivationStateError({@required this.error}) : super([error]);

  @override
  String toString() => 'ActivationStateError { error: $error }';
}
