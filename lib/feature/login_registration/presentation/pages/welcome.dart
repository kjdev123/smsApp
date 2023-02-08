import 'package:flutter/material.dart';
import 'package:imu_survey_new/feature/login_registration/data/models/user_model.dart';
import 'package:imu_survey_new/feature/login_registration/data/models/user_response_model.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class Welcome extends StatelessWidget {
  final User user;

  Welcome({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context).setUser(user);

    return Scaffold(
      body: Container(
        child: Center(
          child: Text("WELCOME PAGE"),
        ),
      ),
    );
  }
}