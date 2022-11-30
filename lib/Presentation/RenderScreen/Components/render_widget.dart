import 'dart:async';

import 'package:ecomerce_web/Presentation/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class RenderWidget extends ChangeNotifier {
  int screenIndex = 1;
  String titleRendered = 'Dashboard';
  Widget widgetRendered = dashBoard();
  void getWidget(Widget widget, String title, int index) {
    widgetRendered = widget;
    titleRendered = title;
    screenIndex = index;
    notifyListeners();
  }
}
