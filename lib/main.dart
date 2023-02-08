import 'package:flutter/material.dart';
import 'package:imu_survey_new/feature/survey/presentation/pages/sample_survey.dart';
import 'package:provider/provider.dart';

import 'core/util/app_preference.dart';
import 'feature/login_registration/data/models/user_response_model.dart';
import 'feature/login_registration/presentation/pages/dashboard.dart';
import 'feature/login_registration/presentation/pages/login.dart';
import 'feature/login_registration/presentation/pages/register.dart';
import 'feature/login_registration/presentation/provider/auth_provider.dart';
import 'feature/login_registration/presentation/provider/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else if (snapshot.data?.email == null)
                      return Login();
                    else
                      UserPreferences().removeUser();
                    // return Welcome(user: snapshot.data!);
                    return Login();
                }
              }),
          routes: {
            '/dashboard': (context) => DashBoard(),
            '/login': (context) => Login(),
            '/register': (context) => Register(),
            '/survey': (context) => SampleSurvey(),
          }),
    );
  }
}