import 'package:bloc_demo/login_page/login_bloc/login_bloc.dart';
import 'package:bloc_demo/login_page/login_bloc/login_event.dart';
import 'package:bloc_demo/login_page/login_bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final usernameFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Bloc Example"),
      ),
      body: Padding(
        padding: EdgeInsets.all(height * 0.04),
        child: Column(
          children: [
            Form(
              key: usernameFormKey,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter username";
                  } else {
                    return null;
                  }
                },
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Username",
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Form(
              key: passwordFormKey,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter password";
                  } else {
                    return null;
                  }
                },
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    suffixIcon: Icon(Icons.visibility)),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            BlocListener<LoginBloc, LoginState>(

              child: SizedBox(),

              listener:(context, state) {

              if (state is LoginLoadingState) {
                showLoadingDialog(context);
              } else if (state is LoginSuccessState) {

                Navigator.pop(context);
                showSnackbar(context, "Success", true);

              } else if (state is LoginFailedState) {
                Navigator.pop(context);
                showSnackbar(context, "Failed", false);
              }
            },),
            ElevatedButton(
                onPressed: () {
                  if (usernameFormKey.currentState!.validate() &&
                      passwordFormKey.currentState!.validate()) {
                    print("Validate");

                    BlocProvider.of<LoginBloc>(context).add(LoginButtonEvent(
                        usernameController.text, passwordController.text));
                  } else {
                    print("unvalidate");
                  }
                },
                child: Text("Login")),
            BlocBuilder<LoginBloc, LoginState>(

              builder: (context, state) {
                if (state is LoginSuccessState) {
                  return Column(
                    children: [
                      Text("first name: " + state.firstName),
                      Text("last name: " + state.lastName),
                    ],
                  );
                } else if (state is LoginFailedState) {
                  return Text("Login Failed:" + state.errorMessage);
                } else {
                  return Column(
                    children: [
                      Text("first name: "),
                      Text("last name: "),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible:
        false, // Prevent dismissing the dialog by tapping outside
    builder: (BuildContext context) {
      return Center(
        child: Card(
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text('Loading...', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void showSnackbar(BuildContext context, String message, bool isSuccess) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(
          isSuccess ? Icons.check_circle : Icons.error,
          color: isSuccess ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            message,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.black87,
    behavior: SnackBarBehavior.floating, // Makes it appear above the bottom bar
    duration: Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
