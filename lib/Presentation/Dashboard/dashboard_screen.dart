import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class dashBoard extends StatefulWidget {
  dashBoard({Key? key}) : super(key: key);

  @override
  State<dashBoard> createState() => _dashBoardState();
}

class _dashBoardState extends State<dashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('dashboard'),
      ),
    );
  }
}
