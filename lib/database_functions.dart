import 'package:demo_dashboard/snackbar.dart';
import 'package:flutter/material.dart';

import 'database_handler.dart';

void loginRegister(String email, String password, void Function() success,
    BuildContext context) {
  String getPassword = "";
  if (Storage.containsValue(email)) {
    if (Storage.getValue(email) == password) {
      ScaffoldMessenger.of(context)
          .showSnackBar(showSnackbar("Successful Login"));
      Storage.setValue("CurrentLoggedInEmail", email);
      success();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(showSnackbar("Incorrect Password"));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(showSnackbar("Successfully Registered"));
    Storage.setValue(email, password);
    Storage.setValue("CurrentLoggedInEmail", email);
    success();
  }
}
