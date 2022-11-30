import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Usecase/subcategory_usecase/allsubcat_usecase.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/cat_provider.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/category_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Common/common_widgets.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Components/subCatItem.dart';

import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_page_controllers.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_provider.dart';
import 'package:ecomerce_web/Presentation/resources/assets_manager.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class allSubCat extends StatefulWidget {
  @override
  State<allSubCat> createState() => _allSubCatState();
}

class _allSubCatState extends State<allSubCat> {
  bool fetSubCatDataAtFirst = true;
  TextEditingController searchCatEditingController = TextEditingController();
  late SubCategoryProvider subcategoryProvider;
  late CategoryPageControllers categoryPageControllers;
  @override
  void initState() {
    subcategoryProvider =
        Provider.of<SubCategoryProvider>(context, listen: false);
    categoryPageControllers =
        Provider.of<CategoryPageControllers>(context, listen: false);
    super.initState();
  }

  Future<void> getData() async {
    await subcategoryProvider
        .allSubCatData(CatIdInput(categoryPageControllers.categoryDetails.id));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: appMargin.m12),
      child: FutureBuilder(
          future: fetSubCatDataAtFirst ? getData() : null,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              fetSubCatDataAtFirst = false;
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              switch (snapshot.error.runtimeType) {
                case Failure:
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showMessage(context, (snapshot.error as Failure).message,
                        Colors.red);
                  });

                  break;
                default:
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showMessage(context,
                        'Something went wrong. Try again later.', Colors.red);
                  });
              }
              return Container();
            } else {
              return Consumer<SubCategoryProvider>(
                  builder: ((context, SubcatData, _) {
                if (SubcatData.allSubCategoryData.isEmpty) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: LayoutBuilder(builder: (context, BoxConstraints) {
                      return Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: BoxConstraints.maxHeight / appSize.s8,
                            ),
                            Container(
                                height: BoxConstraints.maxHeight / appSize.s2,
                                width: BoxConstraints.maxWidth / appSize.s2,
                                child: Lottie.asset(JsonAssets.empty)),
                            Text(
                              'No Sub-Categories added yet.',
                              style: getMediumStyle(
                                  color: ColorManager.primery,
                                  fontsize: FontSize.s18),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                }
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(appPadding.p12,
                          appPadding.p2, appPadding.p12, appPadding.p15),
                      child: TextField(
                          controller: searchCatEditingController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(appSize.s8),
                                borderSide: BorderSide(
                                    color: ColorManager.primery, width: 1.2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(appSize.s8),
                                borderSide: BorderSide(
                                    color: Colors.grey[300]!, width: 1.2)),
                            prefixIcon: Icon(Icons.search),
                            isDense: true,
                            hintText: 'Search sub-category',
                          ),
                          style: getRegulerStyle(
                              color: ColorManager.black,
                              fontsize: FontSize.s14)),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: SubcatData.allSubCategoryData.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (searchCatEditingController.text.isEmpty) {
                              return SubCatItem(SubcatData, index);
                            }
                            if (SubcatData.allSubCategoryData[index].name
                                .toLowerCase()
                                .startsWith(searchCatEditingController.text
                                    .toLowerCase())) {
                              return SubCatItem(SubcatData, index);
                            }
                            return Container();
                          }),
                    ),
                  ],
                );
              }));
            }
          }),
    );
  }
}
