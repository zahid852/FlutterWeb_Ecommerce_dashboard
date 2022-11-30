import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class settingScreen extends StatefulWidget {
  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Settings'),
      ),
    );
  }
}
