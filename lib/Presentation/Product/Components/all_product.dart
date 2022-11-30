import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/all_furtherSubCat_pro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/all_subCat_pro_usecase.dart';
import 'package:ecomerce_web/Presentation/Common/common_widgets.dart';
import 'package:ecomerce_web/Presentation/Product/Components/product_data.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_provider.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../Domain/Usecase/product_Usecases/all_cat_product_usecase.dart';
import '../../resources/assets_manager.dart';

class allProductData extends StatefulWidget {
  @override
  State<allProductData> createState() => _allProductDataState();
}

class _allProductDataState extends State<allProductData> {
  bool fetchProductDataAtFirst = true;
  TextEditingController searchCatEditingController = TextEditingController();
  late ProductProvider productProvider;
  late int parameter;
  late ProductPageController productPageController;
  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    productPageController =
        Provider.of<ProductPageController>(context, listen: false);

    super.initState();
  }

  Future<void> getData() async {
    if (productPageController.allFormat == 'Sub-Category') {
      parameter = productPageController.parameter;
      await productProvider.allSubCatProductsData(AllSubCatProductInput(
          productPageController.categoryDetails.id,
          productPageController.subCatId));
    }

    if (productPageController.allFormat == 'Further-Sub-Category') {
      await productProvider.allFurtherSubCatProductsData(
          AllFurtherSubCatProductInput(
              productPageController.categoryDetails.id,
              productPageController.subCatId,
              productPageController.furtherSubCatId));
    }
    if (productPageController.allFormat == 'Category') {
      await productProvider.allCatProductsData(AllCatProductInput(
        productPageController.categoryDetails.id,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: appPadding.p5, bottom: 5),
      child: FutureBuilder(
          future: fetchProductDataAtFirst ? getData() : null,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              fetchProductDataAtFirst = false;
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
              return Consumer<ProductProvider>(
                  builder: ((context, SubcatProductData, _) {
                if (SubcatProductData.allProduct.isEmpty) {
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
                              'No Products added yet.',
                              style: getMediumStyle(
                                  color: ColorManager.primery,
                                  fontsize: FontSize.s18),
                            ),
                            SizedBox(
                              height: appSize.s28,
                            ),
                            if (productPageController.back)
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              appSize.s4))),
                                  onPressed: () {
                                    productPageController.BackFromProductPage();
                                  },
                                  child: Text(
                                    'Back',
                                    style: getMediumStyle(
                                        color: Colors.white,
                                        fontsize: FontSize.s15),
                                  ))
                          ],
                        ),
                      );
                    }),
                  );
                }
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: appMargin.m12),
                      width: double.infinity,
                      color: Colors.green,
                      padding: EdgeInsets.symmetric(
                          vertical: appPadding.p5, horizontal: appPadding.p10),
                      child: Text(
                        "${productPageController.catHeading} Products",
                        style: getRegulerStyle(
                            color: ColorManager.white, fontsize: FontSize.s14),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(appPadding.p12,
                          appPadding.p2, appPadding.p12, appPadding.p15),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                                controller: searchCatEditingController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(appSize.s8),
                                      borderSide: BorderSide(
                                          color: ColorManager.primery,
                                          width: 1.2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(appSize.s8),
                                      borderSide: BorderSide(
                                          color: Colors.grey[300]!,
                                          width: 1.2)),
                                  prefixIcon: Icon(Icons.search),
                                  isDense: true,
                                  hintText: 'Search product',
                                ),
                                style: getRegulerStyle(
                                    color: ColorManager.black,
                                    fontsize: FontSize.s14)),
                          ),
                          if (productPageController.back)
                            Row(
                              children: [
                                SizedBox(
                                  width: appSize.s18,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(appSize.s5),
                                      )),
                                      onPressed: () {
                                        productPageController
                                            .BackFromProductPage();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        size: 14,
                                      ),
                                      label: Text(
                                        'Back',
                                        style: getMediumStyle(
                                            color: ColorManager.white,
                                            fontsize: FontSize.s16),
                                      )),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: SubcatProductData.allProduct.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (searchCatEditingController.text.isEmpty) {
                              return ProductItem(
                                SubcatProductData.allProduct[index],
                              );
                            }
                            if (SubcatProductData.allProduct[index].name
                                .toLowerCase()
                                .startsWith(searchCatEditingController.text
                                    .toLowerCase())) {
                              return ProductItem(
                                SubcatProductData.allProduct[index],
                              );
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
