import 'package:bloc_demo/login_page/login_bloc/login_event.dart';
import 'package:bloc_demo/login_page/login_bloc/login_state.dart';
import 'package:bloc_demo/repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginButtonEvent>((event, emit) async {
      emit(LoginLoadingState());

      Map<String,dynamic> body = await LoginRepository()
          .loginApi(username: event.username, password: event.password);

      print("Body: " + body.toString());

      if (body.containsKey("message")) {
        emit(LoginFailedState(body["message"]));
      } else {
        emit(LoginSuccessState(body["firstName"], body["lastName"]));
      }
    });
  }
}
