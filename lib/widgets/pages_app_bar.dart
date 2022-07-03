import 'package:flutter/material.dart';
import 'package:tracker/constants/colors.dart';

PreferredSizeWidget? PagesAppBar(
        {title = '',
        backgroundColor = primary,
        centerTitle = true,
        leading: true,
        actions}) =>
    AppBar(
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      title: Text(title),
      actions: actions,
    );
