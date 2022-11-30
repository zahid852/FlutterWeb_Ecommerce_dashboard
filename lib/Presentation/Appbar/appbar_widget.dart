import 'package:ecomerce_web/Presentation/drawer/drawer.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  final String title;
  AppBarWidget({required this.title});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        color: ColorManager.primery,
        child: ListTile(
            leading: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  size: appSize.s20,
                  color: ColorManager.white,
                )),
            title: Text(
              widget.title,
              style: getMediumStyle(
                color: ColorManager.white,
                fontsize: FontSize.s18,
              ),
            )));
  }
}
