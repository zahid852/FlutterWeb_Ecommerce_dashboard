import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/cat_provider.dart';
import 'package:ecomerce_web/Presentation/Common/common_widgets.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Product/product_screen.dart';
import 'package:ecomerce_web/Presentation/resources/assets_manager.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../Data/network/failure.dart';
import 'Provider/product_provider.dart';

class productsByCategories extends StatefulWidget {
  @override
  State<productsByCategories> createState() => _productsByCategoriesState();
}

class _productsByCategoriesState extends State<productsByCategories> {
  bool fetchDataAtStart = false;
  late CategoryProvider categoryProvider;
  late ProductPageController productPageController;
  TextEditingController searchCatEditingController = TextEditingController();
  @override
  void initState() {
    categoryProvider = Provider.of<CategoryProvider>(context, listen: false);

    productPageController =
        Provider.of<ProductPageController>(context, listen: false);
    fetchDataAtStart = true;
    super.initState();
  }

  Future<void> getData() async {
    await categoryProvider.allCatData();
  }

  Widget CatData(CategoryProvider catData, int index) {
    return Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appSize.s4),
            side: BorderSide(color: Colors.grey[200]!)),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: appSize.s12, vertical: appSize.s5),
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
                  imageUrl: catData.allCategoryData[index].imageUrl),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: appSize.s50,
                  alignment: Alignment.centerLeft,
                  // color: Colors.purple,
                  child: Text(
                    catData.allCategoryData[index].name,
                    style: getMediumStyle(
                      color: ColorManager.black,
                      fontsize: FontSize.s16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: appSize.s1,
                        backgroundColor: ColorManager.primery,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(appSize.s5))),
                    onPressed: () {
                      productPageController.changeToCatDetailPage(
                        Category(
                            catData.allCategoryData[index].id,
                            catData.allCategoryData[index].name,
                            catData.allCategoryData[index].des,
                            catData.allCategoryData[index].imageUrl,
                            catData.allCategoryData[index].parameter),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: ColorManager.white,
                      size: appSize.s14,
                    ),
                    label: Text('Sub & Products',
                        style: getMediumStyle(
                            color: ColorManager.white,
                            fontsize: FontSize.s15))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductPageController>(
        builder: (ctx, pageDetails, _) => pageDetails.CatPage
            ? productScreen()
            : Container(
                height: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: appPadding.p28, vertical: appPadding.p20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: appMargin.m14),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Products by Categories',
                        style: getMediumStyle(
                            color: ColorManager.black, fontsize: FontSize.s24),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: appMargin.m12),
                        child: FutureBuilder(
                            future: fetchDataAtStart ? getData() : null,
                            builder: (context, snapshot) {
                              fetchDataAtStart = false;
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                switch (snapshot.error.runtimeType) {
                                  case Failure:
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      showMessage(
                                          context,
                                          (snapshot.error as Failure).message,
                                          Colors.red);
                                    });

                                    break;
                                  default:
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      showMessage(
                                          context,
                                          'Something went wrong. Try again later.',
                                          Colors.red);
                                    });
                                }
                                return Container();
                              } else {
                                return Consumer<CategoryProvider>(
                                    builder: ((context, catData, _) {
                                  if (catData.allCategoryData.isEmpty) {
                                    return Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: LayoutBuilder(
                                          builder: (context, BoxConstraints) {
                                        return Center(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height:
                                                    BoxConstraints.maxHeight /
                                                        appSize.s8,
                                              ),
                                              Container(
                                                  height:
                                                      BoxConstraints.maxHeight /
                                                          appSize.s2,
                                                  width:
                                                      BoxConstraints.maxWidth /
                                                          appSize.s2,
                                                  child: Lottie.asset(
                                                      JsonAssets.empty)),
                                              Text(
                                                'No Category added yet.',
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
                                        padding: EdgeInsets.fromLTRB(
                                            appPadding.p12,
                                            appPadding.p2,
                                            appPadding.p12,
                                            appPadding.p15),
                                        child: TextField(
                                            controller:
                                                searchCatEditingController,
                                            onChanged: (value) {
                                              setState(() {});
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          appSize.s8),
                                                  borderSide: BorderSide(
                                                      color:
                                                          ColorManager.primery,
                                                      width: 1.2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          appSize.s8),
                                                  borderSide: BorderSide(
                                                      color: Colors.grey[300]!,
                                                      width: 1.2)),
                                              prefixIcon: Icon(Icons.search),
                                              isDense: true,
                                              hintText: 'Search category',
                                            ),
                                            style: getRegulerStyle(
                                                color: ColorManager.black,
                                                fontsize: FontSize.s14)),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            itemCount:
                                                catData.allCategoryData.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              if (searchCatEditingController
                                                  .text.isEmpty) {
                                                return CatData(catData, index);
                                              }
                                              if (catData
                                                  .allCategoryData[index].name
                                                  .toLowerCase()
                                                  .startsWith(
                                                      searchCatEditingController
                                                          .text
                                                          .toLowerCase())) {
                                                return CatData(catData, index);
                                              }
                                              return Container();
                                            }),
                                      ),
                                    ],
                                  );
                                }));
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
