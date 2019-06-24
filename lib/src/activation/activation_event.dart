import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ActivationEvent extends Equatable {
  ActivationEvent([List props = const []]) : super(props);
}

class ActivationEventInit extends ActivationEvent {
  @override
  String toString() => 'ActivationEventInit';
}

class ActivationEventActivate extends ActivationEvent {
  final String pin;

  ActivationEventActivate({@required this.pin}) : super([pin]);

  @override
  String toString() => 'ActivationEventActivated { pin: $pin }';
}
