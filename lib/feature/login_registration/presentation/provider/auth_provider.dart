import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imu_survey_new/core/error/error_login.dart';
import 'package:imu_survey_new/core/error/error_registration.dart';
import 'package:imu_survey_new/core/util/app_url.dart';
import 'package:imu_survey_new/feature/login_registration/data/models/user_response_model.dart';

import '../../../../core/util/app_preference.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  Status get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    Map<String, String> queryParams = {'email': email, 'password': password};

    final uri = Uri.https(AppUrl.baseUrl, AppUrl.login, queryParams);

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    http.Response response = await http.post(
      uri,
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      UserResponseModel authUser = UserResponseModel.fromJson(responseData);

      UserPreferences().saveUser(authUser);
      UserPreferences().saveToken(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser.user};
    } else {

      ErrorLogin error = ErrorLogin.fromJson(json.decode(response.body));
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': error.message
      };
    }

    return result;
  }

  Future<Map<String, dynamic>> register(String name, String email,
      String password, String passwordConfirmation) async {
    Map<String, String> queryParams = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation
    };

    // String queryString = Uri.parse(queryParameters: queryParams).query;
    final uri = Uri.https(AppUrl.baseUrl, AppUrl.register, queryParams);
    _registeredInStatus = Status.Registering;
    notifyListeners();

    return await http
        .post(uri, headers: {'Accept': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  static Future<Map<String, dynamic>> onValue(http.Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      // var userData = responseData['user'];
      // var token = responseData['token'];

      UserResponseModel authUser = UserResponseModel.fromJson(responseData);

      UserPreferences().saveUser(authUser);
      UserPreferences().saveToken(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
      ErrorRegistration error = ErrorRegistration.fromJson(responseData);

      result = {
        'status': false,
        'message': 'Registration failed',
        'data': error
      };
    }

    return result;
  }

  static onError(error) {
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
