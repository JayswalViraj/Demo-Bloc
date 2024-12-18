import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CounterState extends Equatable{

}

class IncrementState extends CounterState{

 final int data;

  IncrementState(this.data);
  @override
  // TODO: implement props
  List<Object?> get props => [data];

}

class DecrementState extends CounterState{

 final int data;
  DecrementState(this.data);
  @override
  // TODO: implement props
  List<Object?> get props => [data];

}

class InitialState extends CounterState{
 final int data;
  InitialState(this.data);

  @override
  // TODO: implement props
  List<Object?> get props => [data];

}