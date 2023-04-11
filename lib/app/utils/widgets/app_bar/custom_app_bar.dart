import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    Color? backgroundColor,
    double? elevation,
    Brightness? brightness,
    Widget? title,
    bool? centerTitle,
  }) : super(
          key: key,
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: elevation ?? 0,
          title: title,
          centerTitle: centerTitle ?? false,
        );
}
