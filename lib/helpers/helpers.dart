import 'package:flutter/material.dart';

mixin Helpers {
  void showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : const Color(0xffcd4887),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
