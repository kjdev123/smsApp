import 'package:imu_survey_new/feature/login_registration/data/models/user_model.dart';
import 'package:imu_survey_new/feature/login_registration/data/models/user_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(UserResponseModel userResponse) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("userId", userResponse.user?.id);
    prefs.setString("name", userResponse.user?.name);
    prefs.setString("email", userResponse.user?.email);
    prefs.setString("role", userResponse.user?.role);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt("userId");
    String name = prefs.getString("name");
    String email = prefs.getString("email");
    String role = prefs.getString("role");

    return User(id: userId, name: name, email: email, role: role);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("role");
    prefs.remove("token");
  }

  Future<bool> saveToken(UserResponseModel userResponse) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", userResponse.token);
    return prefs.commit();
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}
