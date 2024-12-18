import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  String firstName;
  String lastName;

  LoginSuccessState(this.firstName, this.lastName);
  @override
  // TODO: implement props
  List<Object?> get props => [firstName, lastName];
}

class LoginFailedState extends LoginState {
  String errorMessage;
  LoginFailedState(this.errorMessage);
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
