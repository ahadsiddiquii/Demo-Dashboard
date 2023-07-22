import 'package:demo_dashboard/screen_configs.dart';
import 'package:flutter/material.dart';

Widget mediumButton(String text, void Function() func, double width) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: ScreenConfig.screenSizeWidth * width,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
