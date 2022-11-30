import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Presentation/Common/common_widgets.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_page_controllers.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class furtherSubCatData extends StatefulWidget {
  String subId;
  String subCatName;
  Category category;
  furtherSubCatData(this.category, this.subId, this.subCatName);

  @override
  State<furtherSubCatData> createState() => _furtherSubCatDataState();
}

class _furtherSubCatDataState extends State<furtherSubCatData> {
  bool isExpand = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productPageController =
        Provider.of<ProductPageController>(context, listen: false);
    return Column(
      children: [
        SizedBox(
          height: appSize.s5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(appSize.s5),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(
              horizontal: appPadding.p8, vertical: appPadding.p5),
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
                  imageUrl: widget.category.imageUrl),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: appSize.s50,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.category.name,
                    style: getMediumStyle(
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
                        color: isExpand ? Colors.red : ColorManager.black,
                      ))),
              SizedBox(
                width: appSize.s12,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.75,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(appSize.s5)),
                        backgroundColor: Colors.white),
                    onPressed: () {
                      productPageController.addFurtherSubCategoryProduct(
                          widget.category, widget.subId, widget.subCatName);
                      productPageController.changeProductPage(1);
                    },
                    icon: Icon(
                      Icons.add,
                      size: 18,
                      color: Colors.red,
                    ),
                    label: Text(
                      'Add Product',
                      style: getMediumStyle(
                        color: Colors.red,
                        fontsize: FontSize.s16,
                      ),
                    )),
              ),
              SizedBox(
                width: appSize.s12,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.75,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(appSize.s5)),
                        backgroundColor: Colors.red),
                    onPressed: () {
                      productPageController.goToFurhterSubCatProductsPage(
                          widget.category.id,
                          widget.category.name,
                          widget.subId,
                          widget.subCatName,
                          widget.category.parameter);
                    },
                    child: Text(
                      'All Products',
                      style: getMediumStyle(
                        color: Colors.white,
                        fontsize: FontSize.s16,
                      ),
                    )),
              ),
            ],
          ),
        ),
        if (isExpand)
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(appPadding.p10, appPadding.p8,
                      appPadding.p10, appPadding.p8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(appSize.s5),
                          bottomRight: Radius.circular(appSize.s5))),
                  child: Text(
                    widget.category.des,
                    style: getRegulerStyle(
                        color: ColorManager.black, fontsize: FontSize.s15),
                  ),
                ),
              ),
              Container(
                color: ColorManager.white,
                padding: EdgeInsets.fromLTRB(appPadding.p10, appPadding.p8,
                    appPadding.p10, appPadding.p8),
                child: Row(
                  children: [
                    Text(
                      'Parameter : ',
                      style: getRegulerStyle(
                          color: ColorManager.black, fontsize: FontSize.s15),
                    ),
                    Text(
                      SellingParameterCategory(
                        widget.category.parameter,
                      ),
                      style: getMediumStyle(
                          color: Colors.red, fontsize: FontSize.s15),
                    )
                  ],
                ),
              )
            ],
          ),
        SizedBox(
          height: appSize.s5,
        ),
      ],
    );
  }
}
