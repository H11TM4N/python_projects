import 'package:flutter/material.dart';
import 'package:ip_address_tracker/src/shared/shared.dart';

class AppSnackbar {
  final BuildContext context;
  AppSnackbar(this.context);

  void showErrorSnackbar(String errorMessage) {
    final snackBar = SnackBar(
      content: Wrap(
        children: [
          Icon(Icons.error_outline, color: Colors.white),
          XBox(10),
          AppText(
            errorMessage,
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(20),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
