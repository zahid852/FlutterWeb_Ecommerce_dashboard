import 'package:ecomerce_web/Presentation/Appbar/appbar_widget.dart';
import 'package:ecomerce_web/Presentation/RenderScreen/Components/render_widget.dart';
import 'package:ecomerce_web/Presentation/drawer/drawer.dart';
import 'package:provider/provider.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:ecomerce_web/Presentation/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class RenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RenderWidget>(builder: (context, renderData, _) {
      return Scaffold(
          appBar: (responsiveLayout.isTiny(context) ||
                  responsiveLayout.isTinyHeightLimit(context) ||
                  responsiveLayout.isComputer(context))
              ? null
              : PreferredSize(
                  child: AppBarWidget(title: renderData.titleRendered),
                  preferredSize: Size(double.infinity, 50)),
          drawer: drawer(),
          body: responsiveLayout(
              tiny: Container(),
              phone: Container(
                  width: double.infinity, child: renderData.widgetRendered),
              tablet: Container(
                  width: double.infinity, child: renderData.widgetRendered),
              computer: Row(
                children: [
                  drawer(),
                  Expanded(child: renderData.widgetRendered)
                ],
              )));
    });
  }
}
