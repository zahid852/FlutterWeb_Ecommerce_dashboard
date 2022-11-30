import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/category_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Common/common_widgets.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_page_controllers.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class categoryDetails extends StatefulWidget {
  @override
  State<categoryDetails> createState() => _categoryDetailsState();
}

class _categoryDetailsState extends State<categoryDetails> {
  late CategoryPageControllers categoryPageControllers;
  late SubCategoryPageControllers subCategoryPageControllers;

  @override
  void initState() {
    categoryPageControllers =
        Provider.of<CategoryPageControllers>(context, listen: false);
    subCategoryPageControllers =
        Provider.of<SubCategoryPageControllers>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: categoryPageControllers.categoryDetails.imageUrl,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.53,
                  fit: BoxFit.fill,
                  errorWidget: (context, value, dynamic) {
                    return Center(
                      child: Icon(
                        Icons.error,
                        color: ColorManager.primery,
                      ),
                    );
                  },
                  placeholder: (BuildContext context, String value) {
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(appPadding.p8, appPadding.p12,
                      appPadding.p8, appPadding.p2),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    categoryPageControllers.categoryDetails.name,
                    style: getMediumStyle(
                        color: ColorManager.primery, fontsize: FontSize.s20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: appPadding.p8, vertical: appPadding.p2),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    categoryPageControllers.categoryDetails.des,
                    style: getRegulerStyle(
                        color: ColorManager.black, fontsize: FontSize.s16),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(appPadding.p8, appPadding.p12,
                      appPadding.p8, appPadding.p2),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Selling Parameter',
                    style: getMediumStyle(
                        color: ColorManager.primery, fontsize: FontSize.s18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: appPadding.p8, vertical: appPadding.p2),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    SellingParameterCategory(
                        categoryPageControllers.categoryDetails.parameter),
                    style: getRegulerStyle(
                        color: ColorManager.black, fontsize: FontSize.s16),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(appPadding.p8, appPadding.p12,
                      appPadding.p8, appPadding.p2),
                  child: Row(
                    children: [
                      Text(
                        'Note :',
                        style: getMediumStyle(
                            color: Colors.red, fontsize: FontSize.s16),
                      ),
                      SizedBox(
                        width: appSize.s5,
                      ),
                      Text(
                        'You can have sub-categories maximum upto level 2.',
                        style: getMediumStyle(
                            color: Colors.red, fontsize: FontSize.s16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
