import 'package:flutter/material.dart';
import 'package:imu_survey_new/feature/login_registration/data/models/user_model.dart';
import 'package:imu_survey_new/feature/login_registration/data/models/user_response_model.dart';
import 'package:imu_survey_new/feature/login_registration/presentation/widgets/sample_list.dart';
import 'package:imu_survey_new/feature/login_registration/presentation/widgets/survey_list_card.dart';

import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    return SampleList();

        // Column(
        //   children: [
        //     SizedBox(
        //       height: 100,
        //     ),
        //     Center(child: Text(user.email!)),
        //     SizedBox(height: 100),
        //     SurveyListCard(),
        //     SizedBox(height: 100),
        //     ElevatedButton(
        //       onPressed: () {},
        //       child: Text("Logout"),
        //       style: ElevatedButton.styleFrom(
        //         primary: Colors.lightBlueAccent, // background
        //       ),
        //     )
        //   ],
        // ),
        // );
  }
}
