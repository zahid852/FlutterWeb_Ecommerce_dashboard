import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Presentation/Product/Components/further_sub_cat_data.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_provider.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_provider.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../Common/common_widgets.dart';

class SubCatData extends StatefulWidget {
  SubCategory subCategory;
  SubCatData(this.subCategory);

  @override
  State<SubCatData> createState() => _SubCatDataState();
}

class _SubCatDataState extends State<SubCatData> {
  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
    final productPageController =
        Provider.of<ProductPageController>(context, listen: false);
    return Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appSize.s4),
            side: BorderSide(color: Colors.grey[200]!)),
        elevation: 0,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: appPadding.p5, horizontal: appPadding.p10),
              child: Row(
                children: [
                  CachedNetworkImage(
                      imageBuilder: ((context, imageProvider) {
                        return Container(
                          height: appSize.s50,
                          width: appSize.s50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        );
                      }),
                      imageUrl: widget.subCategory.imageUrl),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: appSize.s50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.subCategory.name,
                        style: getSemiBoldStyle(
                          color: ColorManager.black,
                          fontsize: FontSize.s16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 40,
                      child: IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            setState(() {
                              isExpand = !isExpand;
                            });
                          },
                          icon: Icon(
                            isExpand ? Icons.expand_less : Icons.expand_more,
                            color: isExpand
                                ? ColorManager.primery
                                : ColorManager.black,
                          ))),
                  if (widget.subCategory.categoryList.isEmpty)
                    Row(
                      children: [
                        SizedBox(
                          width: appSize.s12,
                        ),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  elevation: appSize.s1,
                                  backgroundColor: ColorManager.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(appSize.s5))),
                              onPressed: () {
                                productPageController
                                    .addSubCategoryProduct(widget.subCategory);
                                productPageController.changeProductPage(1);
                              },
                              icon: Icon(
                                Icons.add,
                                color: ColorManager.primery,
                                size: appSize.s18,
                              ),
                              label: Text('Add Product',
                                  style: getMediumStyle(
                                      color: ColorManager.primery,
                                      fontsize: FontSize.s15))),
                        ),
                        SizedBox(
                          width: appSize.s12,
                        ),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: appSize.s1,
                                  backgroundColor: ColorManager.primery,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(appSize.s5))),
                              onPressed: () {
                                productPageController.goToSubCatProductsPage(
                                  widget.subCategory.id,
                                  widget.subCategory.name,
                                  widget.subCategory.parameter,
                                );
                              },
                              child: Text('All Products',
                                  style: getMediumStyle(
                                      color: ColorManager.white,
                                      fontsize: FontSize.s15))),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            if (isExpand)
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(appSize.s4),
                      bottomRight: Radius.circular(appSize.s4),
                    )),
                child: Column(
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      appPadding.p4,
                                      appPadding.p8,
                                      appPadding.p4,
                                      appPadding.p8),
                                  width: double.infinity,
                                  color: ColorManager.white,
                                  child: Text(
                                    widget.subCategory.des,
                                    style: getRegulerStyle(
                                        color: ColorManager.black,
                                        fontsize: FontSize.s15),
                                  )),
                            ),
                            Container(
                              color: ColorManager.white,
                              padding: EdgeInsets.fromLTRB(appPadding.p4,
                                  appPadding.p8, appPadding.p4, appPadding.p8),
                              child: Row(
                                children: [
                                  Text(
                                    'Parameter : ',
                                    style: getRegulerStyle(
                                        color: ColorManager.black,
                                        fontsize: FontSize.s15),
                                  ),
                                  Text(
                                    SellingParameterCategory(
                                      widget.subCategory.parameter,
                                    ),
                                    style: getMediumStyle(
                                        color: ColorManager.primery,
                                        fontsize: FontSize.s15),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        if (widget.subCategory.categoryList.isNotEmpty)
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: appPadding.p12,
                                    vertical: appPadding.p8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.category,
                                          color: Colors.green,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: appSize.s8,
                                        ),
                                        Text('Further Sub-Categories',
                                            style: getMediumStyle(
                                                color: Colors.green,
                                                fontsize: FontSize.s16)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                      appPadding.p10,
                                      appPadding.p0,
                                      appPadding.p10,
                                      appPadding.p5),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount:
                                      widget.subCategory.categoryList.length,
                                  itemBuilder: (context, index) {
                                    return furtherSubCatData(
                                        widget.subCategory.categoryList[index],
                                        widget.subCategory.id,
                                        widget.subCategory.name);
                                  })
                            ],
                          ),
                      ],
                    )),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
