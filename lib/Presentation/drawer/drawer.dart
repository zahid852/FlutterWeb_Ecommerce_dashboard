import 'package:ecomerce_web/Domain/model/model.dart';
import 'package:ecomerce_web/Presentation/Category/category_screen.dart';
import 'package:ecomerce_web/Presentation/Product/product_by_cat_screen.dart';
import 'package:ecomerce_web/Presentation/Product/product_screen.dart';
import 'package:ecomerce_web/Presentation/Settings/setting_screen.dart';
import 'package:ecomerce_web/Presentation/dashboard/dashboard_screen.dart';

import 'package:ecomerce_web/Presentation/resources/assets_manager.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:ecomerce_web/Presentation/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../RenderScreen/Components/render_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class drawer extends StatefulWidget {
  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  final List<buttonInfo> _button = [
    buttonInfo(
      title: 'MARKETING',
      icon: null,
    ),
    buttonInfo(
        title: 'Dashboard', icon: Icons.dashboard, selectedWidget: dashBoard()),
    buttonInfo(
        title: 'Category',
        icon: Icons.category,
        selectedWidget: categoryScreen()),
    buttonInfo(
        title: 'Product',
        icon: Icons.shop,
        selectedWidget: productsByCategories()),
    buttonInfo(title: 'SYSTEM', icon: null),
    buttonInfo(
        title: 'Settings',
        icon: Icons.settings,
        selectedWidget: settingScreen()),
    buttonInfo(title: 'Dark Mode', icon: Icons.light_mode),
  ];
  @override
  Widget build(BuildContext context) {
    final renderWidgetProvider =
        Provider.of<RenderWidget>(context, listen: false);
    return Drawer(
      width: appSize.s250,
      elevation: appSize.s0,
      backgroundColor: Colors.grey[200],
      child: Container(
        padding: EdgeInsets.only(top: appPadding.p8),
        child: Column(
          children: [
            Container(
              child: ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  child: Image.asset(ImageAssets.logo),
                ),
                title: Text(
                  'Ecommerce',
                  textAlign: TextAlign.start,
                  style: getBoldStyle(
                    color: ColorManager.primery,
                    fontsize: FontSize.s20,
                  ),
                ),
                trailing: responsiveLayout.isComputer(context)
                    ? null
                    : Container(
                        width: 26,
                        height: 28,
                        decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: IconButton(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              color: ColorManager.primery,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: appSize.s18,
                              )),
                        ),
                      ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: List.generate(
                  _button.length,
                  (index) => _button[index].icon == null
                      ? Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              left: appPadding.p20,
                              top: appPadding.p10,
                              bottom: appPadding.p10),
                          child: Text(
                            _button[index].title,
                            textAlign: TextAlign.start,
                            style: getMediumStyle(
                                color: ColorManager.black,
                                fontsize: appSize.s16),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(
                              right: appPadding.p18, left: appPadding.p12),
                          child: InkWell(
                            onTap: () {
                              renderWidgetProvider.getWidget(
                                  _button[index].selectedWidget ?? dashBoard(),
                                  _button[index].title,
                                  index);
                            },
                            customBorder: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(appSize.s4)),
                            child: Consumer<RenderWidget>(
                              builder: (context, renderData, _) => Container(
                                  decoration: BoxDecoration(
                                    color: index == renderData.screenIndex
                                        ? ColorManager.primery
                                        : Colors.transparent,
                                    borderRadius:
                                        BorderRadius.circular(appSize.s5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: appPadding.p12,
                                      vertical: appPadding.p10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        _button[index].icon,
                                        size: appSize.s20,
                                        color: index == renderData.screenIndex
                                            ? ColorManager.white
                                            : ColorManager.black,
                                      ),
                                      const SizedBox(
                                        width: appSize.s28,
                                      ),
                                      Text(
                                        _button[index].title,
                                        style: getRegulerStyle(
                                            color:
                                                index == renderData.screenIndex
                                                    ? ColorManager.white
                                                    : ColorManager.black,
                                            fontsize: appSize.s16),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(
                      right: appPadding.p18,
                      left: appPadding.p12,
                      bottom: appPadding.p20,
                      top: appPadding.p12),
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(appSize.s5)),
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(appSize.s5)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: appPadding.p12, vertical: appPadding.p10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.logout,
                            size: appSize.s20,
                          ),
                          const SizedBox(
                            width: appPadding.p28,
                          ),
                          Text(
                            'Logout',
                            style: getRegulerStyle(
                                color: ColorManager.black,
                                fontsize: appSize.s16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
