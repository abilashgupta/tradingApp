import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trade_lab_app/app/app.locator.dart';
import 'package:trade_lab_app/app/app.router.dart';

class LoginViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();
  SnackBar get snackbar => _snackBar;
  final _snackBar = SnackBar(
    content: const Text('Enter the Credentials!'),
  );

  void navigateToDashboard(BuildContext context) {
    if (emailTextController.text != '' && passwordTextController.text != '') {
      _navigator.navigateTo(Routes.dashboard);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
    }
  }
}
