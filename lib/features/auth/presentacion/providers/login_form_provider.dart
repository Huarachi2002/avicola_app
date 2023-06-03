import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static Map<String, String> users = {'user': 'Dario', 'password': 'hiachi20'};
  String user = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    if (users['user'] != user || users['password'] != password) {
      return false;
    }
    print(formKey.currentState?.validate());

    print('$user - $password');

    return formKey.currentState?.validate() ?? false;
  }
}
