import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:imu_survey_new/core/error/error_registration.dart';
import 'package:imu_survey_new/feature/login_registration/data/models/user_model.dart';
import 'package:imu_survey_new/feature/login_registration/data/models/user_response_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/validators.dart';
import '../../../../core/util/widgets.dart';
import '../provider/auth_provider.dart';
import '../provider/user_provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = new GlobalKey<FormState>();

  late String _username, _email, _password, _confirmPassword;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    final usernameField = TextFormField(
      autofocus: false,
      validator: (value) => value!.isEmpty ? "Please enter name" : null,
      onSaved: (value) => _username = value!,
      decoration: buildInputDecoration("Confirm password", Icons.person),
    );

    final emailField = TextFormField(
      autofocus: false,
      validator: (value) => validateEmail(value!),
      onSaved: (value) => _email = value!,
      decoration: buildInputDecoration("Confirm password", Icons.email),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value!.isEmpty ? "Please enter password" : null,
      onChanged: (value) => _password = value,
      decoration: buildInputDecoration("Confirm password", Icons.lock),
    );

    final confirmPassword = TextFormField(
      autofocus: false,
      validator: (value) => validatePassword(_password, value!),
      onSaved: (value) => _confirmPassword = value!,
      obscureText: true,
      decoration: buildInputDecoration("Confirm password", Icons.lock),
    );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );

    doRegister() {
      FocusManager.instance.primaryFocus?.unfocus();
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();
        auth
            .register(_username, _email, _password, _confirmPassword)
            .then((response) {
          if (response['status']) {
            User user = response['user'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.pushReplacementNamed(context, '/dashboard');
          } else {
            ErrorRegistration error = response['data'];

            String? msg = "";

            if (error.errors?.email != null) {
              msg += error.errors?.email!.join(",") as String;
            }

            if (error.errors?.password != null) {
              msg += error.errors?.password!.join(",") as String;
            }

            Flushbar(
              title: "Registration Failed",
              message: msg,
              duration: Duration(seconds: 10),
            ).show(context);
          }
        });
      } else {
        Flushbar(
          title: "Invalid form",
          message: "Please Complete the form properly",
          duration: Duration(seconds: 10),
        ).show(context);
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
                opacity: 0.3
            ),
          ),
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 50.0),
                labelHeader("Sign Up"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.0),
                    label("Name"),
                    SizedBox(height: 5.0),
                    usernameField,
                    SizedBox(height: 10.0),
                    label("Email"),
                    SizedBox(height: 5.0),
                    emailField,
                    SizedBox(height: 10.0),
                    label("Password"),
                    SizedBox(height: 5.0),
                    passwordField,
                    SizedBox(height: 10.0),
                    label("Confirm Password"),
                    SizedBox(height: 5.0),
                    confirmPassword,
                    SizedBox(height: 20.0),
                    auth.loggedInStatus == Status.Authenticating
                        ? loading
                        : longButtons("Register", doRegister),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
