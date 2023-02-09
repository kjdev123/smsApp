import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:imu_survey_new/feature/survey/data/survey_list_model.dart';
import '../../../../core/util/app_url.dart';

enum Status {
  Loading,
  FetchListSuccess,
  FetchListFailed,
}

class SurveyListProvider with ChangeNotifier {
  Status _fetchListStatus = Status.FetchListFailed;

  Status get fetchListStatus => _fetchListStatus;

  Map<String, dynamic> result = {};

  Future<Map<String, dynamic>?> fetchList() async {
    // var result;

    final uri = Uri.https(AppUrl.baseUrl, AppUrl.surveyList);

    _fetchListStatus = Status.Loading;
    notifyListeners();

    http.Response response = await http.post(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      SurveyListModel surveyList = SurveyListModel.fromJson(responseData);

      _fetchListStatus = Status.FetchListSuccess;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'survey': surveyList.survey};
    } else {
      _fetchListStatus = Status.FetchListFailed;
      notifyListeners();
      result = {'status': false, 'message': 'Unable to load data'};
    }

    return result;
  }
}
