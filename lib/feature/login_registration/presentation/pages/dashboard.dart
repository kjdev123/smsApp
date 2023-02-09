import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:imu_survey_new/feature/login_registration/data/models/user_model.dart';
import 'package:imu_survey_new/feature/login_registration/data/models/user_response_model.dart';
import 'package:imu_survey_new/feature/login_registration/presentation/widgets/sample_list.dart';
import 'package:imu_survey_new/feature/login_registration/presentation/widgets/survey_list_card.dart';
import 'package:imu_survey_new/feature/survey/presentation/pages/sample_survey.dart';

import 'package:provider/provider.dart';

import '../../../survey/data/survey_list_model.dart';
import '../provider/survey_list_provider.dart';
import '../provider/user_provider.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late SurveyListModel surveyList;

  @override
  void initState() {
    super.initState();
    final surveyListProvider = Provider.of<SurveyListProvider>(context, listen: false);

    surveyListProvider.fetchList();

    // final Future<Map<String, dynamic>> surveyListResponse = surveyListProvider.fetchList();
    // final postMdl = Provider.of<PostDataProvider>(context, listen: false);

    // surveyListResponse.then((response) {
    //   if (response['status']) {
    //     surveyList = response['survey'];
    //   } else {
    //     Flushbar(
    //       title: "Error",
    //       message: response['message'],
    //       duration: Duration(seconds: 3),
    //     ).show(context);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    final surveyListProvider = Provider.of<SurveyListProvider>(context);

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        CircularProgressIndicator(),
      ],
    );

    // return SampleList();

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: surveyListProvider.fetchListStatus == Status.Loading
              ? Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/main_bg.png'), fit: BoxFit.cover, opacity: 0.3),
                  ),
                  padding: EdgeInsets.all(40.0),
                  child: loading)
              : SampleList(result: surveyListProvider.result)),
    );

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
