import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonEvent extends LoginEvent {
  String username;
  String password;

  LoginButtonEvent(this.username,this.password);
  @override
  // TODO: implement props
  List<Object?> get props => [username,password];
}

