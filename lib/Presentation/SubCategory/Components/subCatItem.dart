import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/category_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Common/common_widgets.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Components/further_subCatItem.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_page_controllers.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_provider.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/string_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Data/mapper/mapper.dart';

class SubCatItem extends StatefulWidget {
  late SubCategoryProvider SubcatData;
  late int index;

  SubCatItem(this.SubcatData, this.index);

  @override
  State<SubCatItem> createState() => _SubCatItemState();
}

class _SubCatItemState extends State<SubCatItem> {
  bool isExpand = false;
  late SubCategoryProvider subcategoryProvider;
  late SubCategoryPageControllers subCategoryPageControllers;
  late CategoryPageControllers categoryPageControllers;
  List<Category> furtherSubCategories = [];
  @override
  void initState() {
    subcategoryProvider =
        Provider.of<SubCategoryProvider>(context, listen: false);
    subCategoryPageControllers =
        Provider.of<SubCategoryPageControllers>(context, listen: false);
    categoryPageControllers =
        Provider.of<CategoryPageControllers>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    subcategoryProvider.furtherSubCategories =
        widget.SubcatData.allSubCategoryData[widget.index].categoryList;
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
                      imageUrl: widget.SubcatData
                          .allSubCategoryData[widget.index].imageUrl),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: appSize.s50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.SubcatData.allSubCategoryData[widget.index].name,
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
                          subCategoryPageControllers.updateSubCategory(
                              2,
                              widget.SubcatData.allSubCategoryData[widget.index]
                                  .id,
                              widget.SubcatData.allSubCategoryData[widget.index]
                                  .name,
                              widget.SubcatData.allSubCategoryData[widget.index]
                                  .des,
                              widget.SubcatData.allSubCategoryData[widget.index]
                                  .imageUrl,
                              widget.SubcatData.allSubCategoryData[widget.index]
                                  .parameter);
                        },
                        icon: Icon(
                          Icons.edit,
                          color: ColorManager.primery,
                          size: appSize.s18,
                        ),
                        label: Text('Edit',
                            style: getMediumStyle(
                                color: ColorManager.primery,
                                fontsize: FontSize.s15))),
                  ),
                  SizedBox(
                    width: appSize.s12,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            elevation: appSize.s1,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(appSize.s5))),
                        onPressed: () {
                          ConfirmDialog(
                              context,
                              subcategoryProvider,
                              categoryPageControllers.categoryDetails.id,
                              widget.SubcatData.allSubCategoryData[widget.index]
                                  .name,
                              widget.SubcatData.allSubCategoryData[widget.index]
                                  .id);
                        },
                        icon: Icon(
                          Icons.delete,
                          size: appSize.s18,
                        ),
                        label: Text('Delete',
                            style: getMediumStyle(
                                color: ColorManager.white,
                                fontsize: FontSize.s15))),
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
                                    widget.SubcatData
                                        .allSubCategoryData[widget.index].des,
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
                                      widget
                                          .SubcatData
                                          .allSubCategoryData[widget.index]
                                          .parameter,
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
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: appPadding.p12,
                              vertical: appPadding.p8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Container(
                                child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        elevation: appSize.s1,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                appSize.s5)),
                                        backgroundColor: ColorManager.white),
                                    onPressed: () {
                                      subCategoryPageControllers
                                          .changeSubCategoryPage(
                                        2,
                                        true,
                                        widget
                                            .SubcatData
                                            .allSubCategoryData[widget.index]
                                            .id,
                                        widget
                                            .SubcatData
                                            .allSubCategoryData[widget.index]
                                            .name,
                                        widget
                                            .SubcatData
                                            .allSubCategoryData[widget.index]
                                            .parameter,
                                      );
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.green,
                                      size: appSize.s18,
                                    ),
                                    label: Text('Add',
                                        style: getMediumStyle(
                                            color: Colors.green,
                                            fontsize: FontSize.s15))),
                              ),
                            ],
                          ),
                        ),
                        Consumer<SubCategoryProvider>(
                            builder: (context, subCatData, _) {
                          if (subCatData.furtherSubCategories.isEmpty) {
                            return Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    bottom: appPadding.p10,
                                    left: appPadding.p15,
                                    right: appPadding.p10),
                                child: Text(
                                  'There are no further sub-categories in ${widget.SubcatData.allSubCategoryData[widget.index].name}.',
                                  style: getRegulerStyle(
                                      color: Colors.red,
                                      fontsize: FontSize.s15),
                                ));
                          }
                          return ListView.builder(
                              padding: EdgeInsets.fromLTRB(appPadding.p10,
                                  appPadding.p0, appPadding.p10, appPadding.p5),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: subCatData.furtherSubCategories.length,
                              itemBuilder: (context, index) {
                                return FurtherSubCatItem(
                                    widget.SubcatData
                                        .allSubCategoryData[widget.index].id,
                                    widget.SubcatData
                                        .allSubCategoryData[widget.index].name,
                                    subCatData.furtherSubCategories[index]);
                              });
                        }),
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
