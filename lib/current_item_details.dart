import 'package:demo_dashboard/helper_widgets.dart';
import 'package:demo_dashboard/screen_configs.dart';
import 'package:flutter/material.dart';

class CurrentItemDetail extends StatelessWidget {
  late IconData icon;
  late String iconName;
  late String description;
  CurrentItemDetail(
      {Key? key,
      required this.icon,
      required this.iconName,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _iconItem() {
      return Container(
        height: ScreenConfig.screenSizeHeight * 0.5,
        width: ScreenConfig.screenSizeWidth * 0.9,
        child: Icon(icon),
        decoration: BoxDecoration(
            color: Colors.pink, borderRadius: BorderRadius.circular(8)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.amber, title: Text(iconName)),
      body: SizedBox(
          width: ScreenConfig.screenSizeWidth,
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                heightGap(0.1),
                _iconItem(),
                heightGap(0.1),
                Text(description),
              ]))),
    );
  }
}
