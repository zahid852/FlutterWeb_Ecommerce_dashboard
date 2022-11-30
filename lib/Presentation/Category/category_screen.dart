import 'package:ecomerce_web/Domain/model/model.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/category_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Category/components/add_cat.dart';
import 'package:ecomerce_web/Presentation/Category/components/all_cat.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:ecomerce_web/Presentation/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class categoryScreen extends StatefulWidget {
  @override
  State<categoryScreen> createState() => _categoryScreenState();
}

class _categoryScreenState extends State<categoryScreen> {
  @override
  Widget build(BuildContext context) {
    final changeCategoryPageProvider =
        Provider.of<CategoryPageControllers>(context, listen: false);
    return Consumer<CategoryPageControllers>(
        builder: ((context, cat_page_data, _) => cat_page_data.SubCatPage
            ? Container(
                height: double.infinity,
                width: double.infinity,
                child: cat_page_data.catWidget,
              )
            : Container(
                height: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: appPadding.p28, vertical: appPadding.p20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (responsiveLayout.isComputer(context))
                      Container(
                        margin: EdgeInsets.only(bottom: appMargin.m14),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Category',
                          style: getMediumStyle(
                              color: ColorManager.black,
                              fontsize: FontSize.s24),
                        ),
                      ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: double.infinity,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  changeCategoryPageProvider
                                      .categoryHeadings.length,
                                  (index) => InkWell(
                                    onTap: () {
                                      changeCategoryPageProvider
                                          .changeCategoryPage(index);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          right: appPadding.p10,
                                          left: appPadding.p10,
                                          top: appPadding.p10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                cat_page_data
                                                    .categoryHeadings[index]
                                                    .icon,
                                                color: cat_page_data
                                                            .currentIndex ==
                                                        index
                                                    ? ColorManager.primery
                                                    : ColorManager.black,
                                                size: appSize.s20,
                                              ),
                                              SizedBox(
                                                width: appSize.s5,
                                              ),
                                              Text(
                                                cat_page_data
                                                    .categoryHeadings[index]
                                                    .title,
                                                style: getMediumStyle(
                                                    color: cat_page_data
                                                                .currentIndex ==
                                                            index
                                                        ? ColorManager.primery
                                                        : Colors.black,
                                                    fontsize: FontSize.s16),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: appSize.s10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: appPadding.p5),
                                            alignment: Alignment.center,
                                            color: cat_page_data.currentIndex ==
                                                    index
                                                ? ColorManager.primery
                                                : Colors.transparent,
                                            height: 4,
                                            width: 130,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: ColorManager.primery,
                          thickness: 0.5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: appSize.s12,
                    ),
                    Expanded(
                      child: Container(
                        child: cat_page_data.catWidget,
                      ),
                    ),
                  ],
                ))));
  }
}
