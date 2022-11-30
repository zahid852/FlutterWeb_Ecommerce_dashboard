import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Presentation/Common/common_widgets.dart';
import 'package:ecomerce_web/Presentation/Product/ProductStock/all_stock.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_provider.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  Product product;

  ProductItem(this.product);
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  void initState() {
    super.initState();
  }

  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final productPageController =
        Provider.of<ProductPageController>(context, listen: false);

    return Container(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(appSize.s5),
              side: BorderSide(color: Colors.grey[200]!)),
          elevation: 0,
          child: Column(
            children: [
              SizedBox(
                height: appSize.s5,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: appPadding.p8,
                ),
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
                        imageUrl: widget.product.image),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: appSize.s50,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.product.name,
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
                              color: isExpand
                                  ? ColorManager.primery
                                  : ColorManager.black,
                            ))),
                    // SizedBox(
                    //   width: appSize.s12,
                    // ),
                    // SizedBox(
                    //   height: 40,
                    //   child: ElevatedButton.icon(
                    //       style: ElevatedButton.styleFrom(
                    //           elevation: 0.75,
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius:
                    //                   BorderRadius.circular(appSize.s5)),
                    //           backgroundColor: Colors.white),
                    //       onPressed: () {
                    //         productPageController.StockCurrentIndex = 0;
                    //         productPageController.StockWidget = allStock();
                    //         StockDialog(context, widget.product);
                    //       },
                    //       icon: Icon(
                    //         Icons.show_chart,
                    //         size: 18,
                    //         color: ColorManager.primery,
                    //       ),
                    //       label: Text(
                    //         'Stock',
                    //         style: getMediumStyle(
                    //           color: ColorManager.primery,
                    //           fontsize: FontSize.s16,
                    //         ),
                    //       )),
                    // ),
                    SizedBox(
                      width: appSize.s12,
                    ),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              elevation: 0.75,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(appSize.s5)),
                              backgroundColor: Colors.white),
                          onPressed: () {
                            if (productPageController.CatProduct) {
                              productPageController.updateCatProduct(
                                1,
                                widget.product,
                              );
                            }
                            if (productPageController.SubCatProduct) {
                              productPageController.updateSubCatProduct(
                                1,
                                widget.product,
                              );
                            }
                            if (productPageController.furtherSubCatProduct) {
                              productPageController.updateFurtherSubCatProduct(
                                1,
                                widget.product,
                              );
                            }
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 18,
                            color: ColorManager.primery,
                          ),
                          label: Text(
                            'Edit',
                            style: getMediumStyle(
                              color: ColorManager.primery,
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
                                  borderRadius:
                                      BorderRadius.circular(appSize.s5)),
                              backgroundColor: ColorManager.primery),
                          onPressed: () {
                            ProductDeleteConfirmDialog(
                              context,
                              productProvider,
                              productPageController,
                              widget.product.pro_id,
                              widget.product.name,
                            );
                          },
                          icon: Icon(
                            Icons.delete,
                            size: 18,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Delete',
                            style: getMediumStyle(
                                color: Colors.white, fontsize: FontSize.s16),
                          )),
                    ),
                  ],
                ),
              ),
              if (isExpand)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      padding: EdgeInsets.fromLTRB(appPadding.p10,
                          appPadding.p10, appPadding.p10, appPadding.p10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[200]!,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(appSize.s5),
                              bottomRight: Radius.circular(appSize.s5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 50),
                            child: Text(
                              'Description',
                              style: getMediumStyle(
                                  color: ColorManager.primery,
                                  fontsize: FontSize.s15),
                            ),
                          ),
                          Text(
                            widget.product.des,
                            style: getRegulerStyle(
                                color: ColorManager.black,
                                fontsize: FontSize.s15),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (productPageController.parameter != 1)
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              color: Colors.grey[200]!,
                              padding: EdgeInsets.fromLTRB(
                                  appPadding.p10,
                                  appPadding.p10,
                                  appPadding.p10,
                                  appPadding.p10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Color',
                                    style: getMediumStyle(
                                        color: ColorManager.primery,
                                        fontsize: FontSize.s15),
                                  ),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Color(
                                          int.parse(widget.product.color)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          if (productPageController.parameter == 2 ||
                              productPageController.parameter == 3)
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              color: Colors.grey[200]!,
                              padding: EdgeInsets.fromLTRB(
                                  appPadding.p10,
                                  appPadding.p10,
                                  appPadding.p10,
                                  appPadding.p10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Size ',
                                    style: getMediumStyle(
                                        color: ColorManager.primery,
                                        fontsize: FontSize.s15),
                                  ),
                                  Text(
                                    widget.product.size,
                                    style: getMediumStyle(
                                        color: ColorManager.black,
                                        fontsize: FontSize.s15),
                                  )
                                ],
                              ),
                            ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            color: Colors.grey[200]!,
                            padding: EdgeInsets.fromLTRB(appPadding.p10,
                                appPadding.p10, appPadding.p10, appPadding.p10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (productPageController.parameter == 1)
                                  Text(
                                    'Limit (kg)',
                                    style: getMediumStyle(
                                        color: ColorManager.primery,
                                        fontsize: FontSize.s15),
                                  ),
                                if (productPageController.parameter != 1)
                                  Text(
                                    'Limit ',
                                    style: getMediumStyle(
                                        color: ColorManager.primery,
                                        fontsize: FontSize.s15),
                                  ),
                                Text(
                                  widget.product.limit,
                                  style: getMediumStyle(
                                      color: ColorManager.black,
                                      fontsize: FontSize.s15),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            color: Colors.grey[200]!,
                            padding: EdgeInsets.fromLTRB(appPadding.p10,
                                appPadding.p10, appPadding.p10, appPadding.p10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (productPageController.parameter == 1)
                                  Text(
                                    'Price (kg)',
                                    style: getMediumStyle(
                                        color: ColorManager.primery,
                                        fontsize: FontSize.s15),
                                  ),
                                if (productPageController.parameter != 1)
                                  Text(
                                    'Price ',
                                    style: getMediumStyle(
                                        color: ColorManager.primery,
                                        fontsize: FontSize.s15),
                                  ),
                                Text(
                                  widget.product.price,
                                  style: getMediumStyle(
                                      color: ColorManager.black,
                                      fontsize: FontSize.s15),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              SizedBox(
                height: appSize.s5,
              ),
            ],
          ),
        ));
  }
}
