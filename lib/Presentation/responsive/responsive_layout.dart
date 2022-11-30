import 'package:flutter/material.dart';

class responsiveLayout extends StatelessWidget {
  final Widget tiny; //if the size is extremely small
  final Widget phone;
  final Widget tablet;
  final Widget computer;
  responsiveLayout(
      {required this.tiny,
      required this.phone,
      required this.tablet,
      required this.computer});

  static const int tinyHeightLimit = 100;
  static const int tinyLimit = 300;
  static const int phoneLimit = 800;
  static const int tabLimit = 1100;

  static bool isTinyHeightLimit(BuildContext context) =>
      MediaQuery.of(context).size.height < tinyHeightLimit;

  static bool isTiny(BuildContext context) =>
      MediaQuery.of(context).size.width < tinyLimit;

  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width >= tinyLimit &&
      MediaQuery.of(context).size.width < phoneLimit;

  static bool isTab(BuildContext context) =>
      MediaQuery.of(context).size.width >= phoneLimit &&
      MediaQuery.of(context).size.width < tabLimit;

  static bool isComputer(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < tinyLimit ||
          constraints.maxHeight < tinyHeightLimit) {
        return tiny;
      }
      if (constraints.maxWidth < phoneLimit) {
        return phone;
      }
      if (constraints.maxWidth < tabLimit) {
        return tablet;
      } else {
        return computer;
      }
    });
  }
}
