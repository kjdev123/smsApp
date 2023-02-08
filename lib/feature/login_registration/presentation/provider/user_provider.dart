import 'package:flutter/foundation.dart';
import 'package:imu_survey_new/feature/login_registration/data/models/user_response_model.dart';

import '../../data/models/user_model.dart';

class UserProvider with ChangeNotifier {
  late User _user;

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
