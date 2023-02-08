import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/widgets.dart';
import '../../data/models/user_response_model.dart';
import '../provider/auth_provider.dart';
import '../provider/user_provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();

  late String _username, _password;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final usernameField = TextFormField(
      autofocus: false,
      validator: (value) => value!.isEmpty ? "Please enter email" : null,
      onSaved: (value) => _username = value!,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value!.isEmpty ? "Please enter password" : null,
      onSaved: (value) => _password = value!,
      decoration: buildInputDecoration("Confirm password", Icons.lock),
    );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        CircularProgressIndicator(),
        Text(" Authenticating ... Please wait")
      ],
    );

    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
//         TextButton(
//           style: TextButton.styleFrom(
//             padding: EdgeInsets.all(0.0),
//           ),
//           child: Text("Forgot password?",
//               style: TextStyle(fontWeight: FontWeight.w300)),
//           onPressed: () {
// //            Navigator.pushReplacementNamed(context, '/reset-password');
//           },
//         ),
        Text("Doesn't has any account?"),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.only(left: 0.0),
          ),
          child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.w300)),
          onPressed: () {
            Navigator.of(context).pushNamed('/register');
          },
        ),
      ],
    );

    doLogin() {
      FocusManager.instance.primaryFocus?.unfocus();
      final form = formKey.currentState;

      if (form!.validate()) {
        form.save();

        final Future<Map<String, dynamic>> successfulMessage =
            auth.login(_username, _password);

        successfulMessage.then((response) {
          if (response['status']) {
            User user = response['user'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.pushReplacementNamed(context, '/dashboard');
          } else {
            Flushbar(
              title: "Failed Login",
              message: response['message'],
              duration: Duration(seconds: 3),
            ).show(context);
          }
        });
      } else {
        print("form is invalid");
      }
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/main_bg.png'),
                fit: BoxFit.cover,
                opacity: 0.3),
          ),
          // padding: EdgeInsets.all(40.0),
          // margin: const EdgeInsets.all(30.0),
          // decoration:
          //     BoxDecoration(border: Border.all(color: Colors.cyan.shade200)),
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Container(
              // margin: const EdgeInsets.all(30.0),
              // padding: EdgeInsets.all(20.0),
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.cyan.shade200)),
              child: Column(
                children: [
                  Image.asset('assets/images/imu_logo.png'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: 15.0),
                      label("Email"),
                      SizedBox(height: 5.0),
                      usernameField,
                      SizedBox(height: 20.0),
                      label("Password"),
                      SizedBox(height: 5.0),
                      passwordField,
                      SizedBox(height: 20.0),
                      auth.loggedInStatus == Status.Authenticating
                          ? loading
                          : longButtons("Login", doLogin),
                      SizedBox(height: 5.0),
                      forgotLabel
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
