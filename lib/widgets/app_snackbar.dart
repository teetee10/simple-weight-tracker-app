import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppSnackBar {
  BuildContext? context;
  String? title;
  String? content;
  Color? color;
  bool active = false;

  AppSnackBar([this.title, this.content, this.context, this.color]) {
    color = title?.toLowerCase() == 'error' ? Colors.red : Colors.green;
    show();
  }

  void show() => Flushbar(
        margin: const EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(12),
        title: title?.toUpperCase(),
        backgroundColor: color!,
        showProgressIndicator: false,
        progressIndicatorValueColor: const AlwaysStoppedAnimation<Color>(primary),
        progressIndicatorBackgroundColor: color,
        icon: const Icon(Icons.info_outline, color: Colors.white),
        isDismissible: true,
        animationDuration: const Duration(milliseconds: 300),
        message: content,
        duration: const Duration(seconds: 2),
      )..show(context!);
}
