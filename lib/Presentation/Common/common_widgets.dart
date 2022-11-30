import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Usecase/category_Usecases/deletecat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/furthersubcategory_usecase/deletefurthersubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/delete_catPro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/delete_furtherSubCatPro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/delete_subCat_pro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/subcategory_usecase/deletesubcat_usecase.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/cat_provider.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_provider.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_provider.dart';
import 'package:ecomerce_web/Presentation/resources/assets_manager.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/string_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:ecomerce_web/Presentation/responsive/responsive_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

void showMessage(BuildContext context, String message, Color color,
    [int seconds = 2]) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: responsiveLayout.isComputer(context)
        ? SnackBarBehavior.floating
        : SnackBarBehavior.fixed,
    content: Text(message),
    backgroundColor: color,
    margin: responsiveLayout.isComputer(context)
        ? EdgeInsets.only(left: appSize.s250)
        : null,
    shape: RoundedRectangleBorder(),
    duration: Duration(seconds: seconds),
  ));
}

void LoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: appSize.s100,
            width: appSize.s100,
            child: Lottie.asset(JsonAssets.loading),
          ),
        );
      });
}

String SellingParameterCategory(int index) {
  String parameter_value = Empty;
  switch (index) {
    case 0:
      parameter_value = 'Fixed';
      break;
    case 1:
      parameter_value = 'Grams & Kg';
      break;
    case 2:
      parameter_value = 'Color & Descriptive Size';
      break;
    case 3:
      parameter_value = 'Color & Numeric Size';
      break;
    default:
      parameter_value = 'Fixed';
  }
  return parameter_value;
}

// void StockDialog(BuildContext context, Product product) {
//   showDialog(
//       context: context,
//       builder: (ctx) {
//         return Dialog(
//             child: Consumer<ProductPageController>(
//                 builder: ((context, pageData, _) => Container(
//                     height: double.infinity,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: appPadding.p28, vertical: appPadding.p20),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         if (responsiveLayout.isComputer(context))
//                           Container(
//                             margin: EdgeInsets.only(bottom: appMargin.m14),
//                             alignment: Alignment.centerLeft,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   '${product.name} Stock',
//                                   style: getMediumStyle(
//                                       color: ColorManager.black,
//                                       fontsize: FontSize.s24),
//                                 ),
//                                 SizedBox(
//                                   height: 40,
//                                   child: ElevatedButton.icon(
//                                       style: ElevatedButton.styleFrom(
//                                           shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(appSize.s5),
//                                       )),
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       },
//                                       icon: Icon(
//                                         Icons.arrow_back_ios,
//                                         size: 14,
//                                       ),
//                                       label: Text(
//                                         'Back',
//                                         style: getMediumStyle(
//                                             color: ColorManager.white,
//                                             fontsize: FontSize.s16),
//                                       )),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         Stack(
//                           alignment: Alignment.bottomCenter,
//                           children: [
//                             Container(
//                               width: double.infinity,
//                               child: SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: List.generate(
//                                       pageData.ProductStockHeadings.length,
//                                       (index) => InkWell(
//                                         onTap: () {
//                                           pageData
//                                               .changeProductStockPage(index);
//                                         },
//                                         child: Container(
//                                           padding: EdgeInsets.only(
//                                               right: appPadding.p10,
//                                               left: appPadding.p10,
//                                               top: appPadding.p10),
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Icon(
//                                                     pageData
//                                                         .ProductStockHeadings[
//                                                             index]
//                                                         .icon,
//                                                     color: pageData
//                                                                 .StockCurrentIndex ==
//                                                             index
//                                                         ? ColorManager.primery
//                                                         : ColorManager.black,
//                                                     size: appSize.s20,
//                                                   ),
//                                                   SizedBox(
//                                                     width: appSize.s5,
//                                                   ),
//                                                   Text(
//                                                     pageData
//                                                         .ProductStockHeadings[
//                                                             index]
//                                                         .title,
//                                                     style: getMediumStyle(
//                                                         color: pageData
//                                                                     .StockCurrentIndex ==
//                                                                 index
//                                                             ? ColorManager
//                                                                 .primery
//                                                             : Colors.black,
//                                                         fontsize: FontSize.s16),
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 height: appSize.s10,
//                                               ),
//                                               Container(
//                                                 margin: EdgeInsets.only(
//                                                     left: appPadding.p5),
//                                                 alignment: Alignment.center,
//                                                 color:
//                                                     pageData.StockCurrentIndex ==
//                                                             index
//                                                         ? ColorManager.primery
//                                                         : Colors.transparent,
//                                                 height: 4,
//                                                 width: 130,
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     )),
//                               ),
//                             ),
//                             Divider(
//                               height: 1,
//                               color: ColorManager.primery,
//                               thickness: 0.5,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: appSize.s12,
//                         ),
//                         Expanded(
//                           child: Container(
//                             child: pageData.StockWidget,
//                           ),
//                         ),
//                       ],
//                     )))));
//       });
// }

void ConfirmDialog(
    BuildContext ctx, dynamic categoryProvider, String id, String cat_name,
    [String SubCatId = Empty,
    String FurtherSubCatId = Empty,
    bool DeleteFurtherSubCat = false]) {
  FirebaseDatabase database = FirebaseDatabase.instance;
  showDialog(
      context: ctx,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: appPadding.p14, vertical: appPadding.p15),
          child: AlertDialog(
            title: Container(
              child: SizedBox(
                  height: appSize.s100,
                  width: appSize.s100,
                  child: Lottie.asset(JsonAssets.warning)),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Are you sure, you want to delete ${cat_name} category?',
                  style: getMediumStyle(color: Colors.black, fontsize: 16),
                ),
                Text(
                  "${cat_name}'s all data will be deleted permanently!",
                  style: getRegulerStyle(color: Colors.black, fontsize: 15),
                ),
              ],
            ),
            actions: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: appPadding.p10, horizontal: appPadding.p10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(appSize.s5),
                        )),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: getMediumStyle(
                              color: ColorManager.white,
                              fontsize: FontSize.s15),
                        )),
                    SizedBox(
                      width: appSize.s14,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(appSize.s5),
                        )),
                        onPressed: () async {
                          try {
                            Navigator.of(ctx).pop();
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              LoadingDialog(ctx);
                            });
                            switch (categoryProvider.runtimeType) {
                              case CategoryProvider:
                                await categoryProvider
                                    .deleteCatData(CatDeleteInput(id));
                                await categoryProvider
                                    .deleteCatSubData(CatDeleteInput(id));

                                break;
                              case SubCategoryProvider:
                                if (!DeleteFurtherSubCat) {
                                  await categoryProvider.deleteSubCatData(
                                      SubCatDeleteInput(id, SubCatId));
                                } else {
                                  await categoryProvider
                                      .deleteFurtherSubCatData(
                                          FurtherSubCatDeleteInput(
                                              id, SubCatId, FurtherSubCatId));
                                }

                                break;
                            }
                            showMessage(
                                ctx, AppStrings.dataDeleted, Colors.green);

                            Navigator.of(ctx).pop();
                          } on Failure catch (error) {
                            Navigator.of(ctx).pop();
                            showMessage(context, error.message, Colors.red);
                          } catch (error) {
                            Navigator.of(ctx).pop();
                            showMessage(
                              ctx,
                              AppStrings.dataNotDeleted,
                              Colors.red,
                            );
                          }
                        },
                        child: Text(
                          'Delete',
                          style: getMediumStyle(
                              color: ColorManager.white,
                              fontsize: FontSize.s15),
                        )),
                  ],
                ),
              )
            ],
          ),
        );
      });
}

void ProductDeleteConfirmDialog(
    BuildContext ctx,
    ProductProvider productProvider,
    ProductPageController productPageController,
    String Product_id,
    String pro_name) {
  showDialog(
      context: ctx,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: appPadding.p14, vertical: appPadding.p15),
          child: AlertDialog(
            title: Container(
              child: SizedBox(
                  height: appSize.s100,
                  width: appSize.s100,
                  child: Lottie.asset(JsonAssets.warning)),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Are you sure, you want to delete ${pro_name} product?',
                  style: getMediumStyle(color: Colors.black, fontsize: 16),
                ),
                Text(
                  "${pro_name}'s all data will be deleted permanently!",
                  style: getRegulerStyle(color: Colors.black, fontsize: 15),
                ),
              ],
            ),
            actions: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: appPadding.p10, horizontal: appPadding.p10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(appSize.s5),
                        )),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: getMediumStyle(
                              color: ColorManager.white,
                              fontsize: FontSize.s15),
                        )),
                    SizedBox(
                      width: appSize.s14,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(appSize.s5),
                        )),
                        onPressed: () async {
                          try {
                            Navigator.of(ctx).pop();
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              LoadingDialog(ctx);
                            });

                            if (productPageController.SubCatProduct) {
                              await productProvider.DeleteSubCatProduct(
                                  DeleteSubCatProductInput(
                                      productPageController.categoryDetails.id,
                                      productPageController.subCatId,
                                      Product_id));
                            }
                            if (productPageController.furtherSubCatProduct) {
                              await productProvider.DeleteFurtherSubCatProduct(
                                  DeleteFurtherSubCatProductInput(
                                      productPageController.categoryDetails.id,
                                      productPageController.subCatId,
                                      productPageController.furtherSubCatId,
                                      Product_id));
                            }
                            if (productPageController.CatProduct) {
                              await productProvider.DeleteCatProduct(
                                  DeleteCatProductInput(
                                productPageController.categoryDetails.id,
                                Product_id,
                              ));
                            }

                            showMessage(
                                ctx, AppStrings.dataDeleted, Colors.green);

                            Navigator.of(ctx).pop();
                          } on Failure catch (error) {
                            Navigator.of(ctx).pop();
                            showMessage(context, error.message, Colors.red);
                          } catch (error) {
                            Navigator.of(ctx).pop();
                            showMessage(
                              ctx,
                              AppStrings.dataNotDeleted,
                              Colors.red,
                            );
                          }
                        },
                        child: Text(
                          'Delete',
                          style: getMediumStyle(
                              color: ColorManager.white,
                              fontsize: FontSize.s15),
                        )),
                  ],
                ),
              )
            ],
          ),
        );
      });
}
