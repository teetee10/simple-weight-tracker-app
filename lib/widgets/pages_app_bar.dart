import 'package:flutter/material.dart';
import 'package:tracker/constants/colors.dart';

PreferredSizeWidget? PagesAppBar(
        {title = '',
        backgroundColor = kPrimary,
        centerTitle = true,
        leading: true,
        actions}) =>
    AppBar(
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      title: Text(title),
      actions: actions,
    );
