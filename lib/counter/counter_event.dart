import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {}

class IncrementEvent extends CounterEvent {
  int data;
  IncrementEvent(this.data);

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

class DecrementEvent extends CounterEvent {
  int data;
  DecrementEvent(this.data);

  @override
  // TODO: implement props
  List<Object?> get props => [data];


}
