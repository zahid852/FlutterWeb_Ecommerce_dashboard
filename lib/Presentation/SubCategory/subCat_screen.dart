import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Presentation/Category/Components/all_cat.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/category_page_controllers.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Components/category_details.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_page_controllers.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:ecomerce_web/Presentation/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubCatScreen extends StatefulWidget {
  @override
  State<SubCatScreen> createState() => _SubCatScreenState();
}

class _SubCatScreenState extends State<SubCatScreen> {
  late CategoryPageControllers categoryPageControllers;
  late SubCategoryPageControllers subCategoryPageControllers;

  @override
  void initState() {
    categoryPageControllers =
        Provider.of<CategoryPageControllers>(context, listen: false);
    subCategoryPageControllers =
        Provider.of<SubCategoryPageControllers>(context, listen: false);
    subCategoryPageControllers.currentIndex = Zero;
    subCategoryPageControllers.catWidget = categoryDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SubCategoryPageControllers>(
        builder: ((context, subcat_page_data, _) => Container(
            height: double.infinity,
            padding: const EdgeInsets.fromLTRB(
                appPadding.p28, appPadding.p20, appPadding.p28, appPadding.p10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (responsiveLayout.isComputer(context))
                  Container(
                    margin: EdgeInsets.only(bottom: appMargin.m14),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Inside ${categoryPageControllers.categoryDetails.name} Category',
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontsize: FontSize.s20),
                        ),
                        InkWell(
                          onTap: () {
                            categoryPageControllers.BackFromCatDetailPage();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(appSize.s4),
                            ),
                            padding: EdgeInsets.fromLTRB(
                                appPadding.p8, appPadding.p5, appPadding.p8, 6),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: appPadding.p2, right: appPadding.p5),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: appSize.s14,
                                    color: ColorManager.primery,
                                  ),
                                ),
                                Text(
                                  'Back to All Categories',
                                  style: getMediumStyle(
                                      color: ColorManager.primery,
                                      fontsize: FontSize.s16),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
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
                              subCategoryPageControllers
                                  .categoryHeadings.length,
                              (index) => InkWell(
                                onTap: () {
                                  subCategoryPageControllers
                                      .changeSubCategoryPage(index);
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
                                            subcat_page_data
                                                .categoryHeadings[index].icon,
                                            color:
                                                subcat_page_data.currentIndex ==
                                                        index
                                                    ? ColorManager.primery
                                                    : ColorManager.black,
                                            size: appSize.s20,
                                          ),
                                          SizedBox(
                                            width: appSize.s5,
                                          ),
                                          Text(
                                            subcat_page_data
                                                .categoryHeadings[index].title,
                                            style: getMediumStyle(
                                                color: subcat_page_data
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
                                        color: subcat_page_data.currentIndex ==
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
                    child: subcat_page_data.catWidget,
                  ),
                ),
              ],
            ))));
  }
}
