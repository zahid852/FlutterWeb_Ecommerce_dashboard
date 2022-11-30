import 'package:ecomerce_web/Presentation/Category/Provider/category_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_page_controllers.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:ecomerce_web/Presentation/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class productScreen extends StatefulWidget {
  @override
  State<productScreen> createState() => _productScreenState();
}

class _productScreenState extends State<productScreen> {
  @override
  Widget build(BuildContext context) {
    final productPageControllers =
        Provider.of<ProductPageController>(context, listen: false);
    return Consumer<ProductPageController>(
        builder: ((context, pro_page_data, _) => Container(
            height: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: appPadding.p28, vertical: appPadding.p15),
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
                          'Inside ${productPageControllers.categoryDetails.name} Category',
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontsize: FontSize.s20),
                        ),
                        InkWell(
                          onTap: () {
                            productPageControllers.BackFromCatDetailPage();
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
                                  'Back to Product Categories',
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
                              productPageControllers.ProductHeadings.length,
                              (index) => InkWell(
                                onTap: () {
                                  productPageControllers.addCategoryProduct();
                                  productPageControllers
                                      .changeProductPage(index);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      right: appPadding.p10,
                                      left: appPadding.p10,
                                      top: appPadding.p5),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            pro_page_data
                                                .ProductHeadings[index].icon,
                                            color: pro_page_data.currentIndex ==
                                                    index
                                                ? ColorManager.primery
                                                : ColorManager.black,
                                            size: appSize.s20,
                                          ),
                                          SizedBox(
                                            width: appSize.s5,
                                          ),
                                          Text(
                                            pro_page_data
                                                .ProductHeadings[index].title,
                                            style: getMediumStyle(
                                                color: pro_page_data
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
                                        color:
                                            pro_page_data.currentIndex == index
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
                    child: pro_page_data.ProductWidget,
                  ),
                ),
              ],
            ))));
  }
}
