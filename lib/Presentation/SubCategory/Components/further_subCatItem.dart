import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/category_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Common/common_widgets.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_page_controllers.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_provider.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FurtherSubCatItem extends StatefulWidget {
  String currentSubCatId;
  String currentSubCatName;
  Category category;
  FurtherSubCatItem(
      this.currentSubCatId, this.currentSubCatName, this.category);
  @override
  State<FurtherSubCatItem> createState() => _FurtherSubCatItemState();
}

class _FurtherSubCatItemState extends State<FurtherSubCatItem> {
  late SubCategoryPageControllers subCategoryPageControllers;
  late SubCategoryProvider subCategoryProvider;
  late CategoryPageControllers categoryPageControllers;
  @override
  void initState() {
    subCategoryPageControllers =
        Provider.of<SubCategoryPageControllers>(context, listen: false);
    subCategoryProvider =
        Provider.of<SubCategoryProvider>(context, listen: false);
    categoryPageControllers =
        Provider.of<CategoryPageControllers>(context, listen: false);
    super.initState();
  }

  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
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
                      subCategoryPageControllers.updateSubCategory(
                          2,
                          widget.currentSubCatId,
                          widget.category.name,
                          widget.category.des,
                          widget.category.imageUrl,
                          widget.category.parameter,
                          true,
                          widget.category.id,
                          widget.currentSubCatName);
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 18,
                      color: Colors.red,
                    ),
                    label: Text(
                      'Edit',
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
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.75,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(appSize.s5)),
                        backgroundColor: Colors.white),
                    onPressed: () {
                      ConfirmDialog(
                          context,
                          subCategoryProvider,
                          categoryPageControllers.categoryDetails.id,
                          widget.category.name,
                          widget.currentSubCatId,
                          widget.category.id,
                          true);
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 18,
                      color: Colors.red,
                    ),
                    label: Text(
                      'Delete',
                      style: getMediumStyle(
                          color: Colors.red, fontsize: FontSize.s16),
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
                          color: ColorManager.primery, fontsize: FontSize.s15),
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
