import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/add_cat_product.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/addfurther_subcat_pro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/addsubcat_product_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/update_furSubCatPro_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/product_Usecases/update_subcatpro_usecase.dart';
import 'package:ecomerce_web/Presentation/Common/common_widgets.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Product/Provider/product_provider.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/string_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:ecomerce_web/Presentation/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../../../Domain/Usecase/product_Usecases/update_catPro_usecase.dart';
import '../../resources/color_manager.dart';

class AddProductData extends StatefulWidget {
  bool add;
  AddProductData(this.add);
  @override
  State<AddProductData> createState() => _AddProductDataState();
}

class _AddProductDataState extends State<AddProductData> {
  final _ProductAddFormKey = GlobalKey<FormState>();
  //late CategoryPageControllers changeCategoryPageProvider;
  List<String> sizeDescriptiveItems = ['Small', 'Medium', 'Large'];
  String selectedDescriptedSizeItem = Empty;
  TextEditingController _numericSizeController = TextEditingController();
  TextEditingController _MinimumLimitEditingController =
      TextEditingController();

  TextEditingController _priceEditingController = TextEditingController();
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _desEditingController = TextEditingController();
  TextEditingController _imageUrlEditingController = TextEditingController();
  Color SelectedColor = Colors.transparent;
  String defaultSizeDescriptiveItem = 'Medium';

  late ProductProvider productProvider;
  late ProductPageController productPageController;
  String product_id = Empty;
  String name = Empty;
  String des = Empty;
  String imageUrl = Empty;
  String size = Empty;
  String limit = Empty;
  String price = Empty;
  bool loadImage = false;
  bool isSaving = false;
  bool isFormValid = false;

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    productPageController =
        Provider.of<ProductPageController>(context, listen: false);
    if (!widget.add) {
      _nameEditingController.text = productPageController.productForUpdate.name;
      _desEditingController.text = productPageController.productForUpdate.des;
      _imageUrlEditingController.text =
          productPageController.productForUpdate.image;
      _priceEditingController.text =
          productPageController.productForUpdate.price;
      if (productPageController.parameter == 3) {
        _numericSizeController.text =
            productPageController.productForUpdate.size;
      }
      if (productPageController.parameter == 2) {
        defaultSizeDescriptiveItem =
            productPageController.productForUpdate.size;
      }
      if (productPageController.parameter != 1) {
        SelectedColor =
            Color(int.parse(productPageController.productForUpdate.color));
      }
      _MinimumLimitEditingController.text =
          productPageController.productForUpdate.limit;
    }
    super.initState();
  }

  void SubmitCatForm() async {
    isFormValid = _ProductAddFormKey.currentState!.validate();

    FocusScope.of(context).unfocus();
    if (isFormValid) {
      if (productPageController.parameter == 3 ||
          productPageController.parameter == 4) {
        if (SelectedColor == Colors.transparent) {
          return showMessage(
              context, 'Please select product color.', Colors.red);
        }
      }
      _ProductAddFormKey.currentState!.save();
      try {
        setState(() {
          isSaving = true;
        });
        if (widget.add && productPageController.addFormat == 'Sub-Category') {
          await productProvider.addSubCatProduct(AddSubCatProductInput(
              productPageController.categoryDetails.id,
              productPageController.subCatId,
              name,
              des,
              imageUrl,
              SelectedColor.value.toString(),
              productPageController.parameter == 2
                  ? selectedDescriptedSizeItem
                  : size,
              limit,
              price));
        }
        if (widget.add == false &&
            productPageController.addFormat == 'Sub-Category') {
          await productProvider.updateSubCatProduct(UpdateSubCatProductInput(
              productPageController.categoryDetails.id,
              productPageController.subCatId,
              productPageController.productForUpdate.pro_id,
              name,
              des,
              imageUrl,
              SelectedColor.value.toString(),
              productPageController.parameter == 2
                  ? selectedDescriptedSizeItem
                  : size,
              limit,
              price));
        }
        if (widget.add == false &&
            productPageController.addFormat == 'Category') {
          await productProvider.updateCatProduct(UpdateCatProductInput(
              productPageController.categoryDetails.id,
              productPageController.productForUpdate.pro_id,
              name,
              des,
              imageUrl,
              SelectedColor.value.toString(),
              productPageController.parameter == 2
                  ? selectedDescriptedSizeItem
                  : size,
              limit,
              price));
        }
        if (widget.add == false &&
            productPageController.addFormat == 'Further-Sub-Category') {
          await productProvider.updateFurtherSubCatProduct(
              UpdateFurtherSubCatProductInput(
                  productPageController.categoryDetails.id,
                  productPageController.subCatId,
                  productPageController.furtherSubCatId,
                  productPageController.productForUpdate.pro_id,
                  name,
                  des,
                  imageUrl,
                  SelectedColor.value.toString(),
                  productPageController.parameter == 2
                      ? selectedDescriptedSizeItem
                      : size,
                  limit,
                  price));
        }
        if (widget.add &&
            productPageController.addFormat == 'Further-Sub-Category') {
          await productProvider.addFurtherSubCatProduct(
              AddFurtherSubCatProductInput(
                  productPageController.categoryDetails.id,
                  productPageController.subCatId,
                  productPageController.furtherSubCatId,
                  name,
                  des,
                  imageUrl,
                  SelectedColor.value.toString(),
                  productPageController.parameter == 2
                      ? selectedDescriptedSizeItem
                      : size,
                  limit,
                  price));
        }
        if (widget.add && productPageController.addFormat == 'Category') {
          await productProvider.addCatProduct(AddCatProductInput(
              productPageController.categoryDetails.id,
              name,
              des,
              imageUrl,
              SelectedColor.value.toString(),
              productPageController.parameter == 2
                  ? selectedDescriptedSizeItem
                  : size,
              limit,
              price));
        }

        // if (!widget.add)
        // await categoryProvider.updateCatData(CatUpdateInput(
        //     category_id, name, des, imageUrl, currentParameterIndex));
        showMessage(
            context,
            widget.add ? AppStrings.dataAdded : AppStrings.dataUpdated,
            Colors.green);
        setState(() {
          name = Empty;
          des = Empty;
          imageUrl = Empty;
          size = Empty;
          limit = Empty;
          price = Empty;
          if (widget.add) {
            _nameEditingController.clear();
            _desEditingController.clear();
            _imageUrlEditingController.clear();
            _numericSizeController.clear();

            _priceEditingController.clear();
            _MinimumLimitEditingController.clear();
            SelectedColor = Colors.transparent;
            loadImage = false;
          }
          if (!widget.add) {
            _nameEditingController.text = productProvider.productWithoutId.name;
            _desEditingController.text = productProvider.productWithoutId.des;
            _imageUrlEditingController.text =
                productProvider.productWithoutId.image;
            if (productPageController.parameter == 3) {
              _numericSizeController.text =
                  productProvider.productWithoutId.size;
            }
            if (productPageController.parameter == 2) {
              defaultSizeDescriptiveItem =
                  productProvider.productWithoutId.size;
            }
            if (productPageController.parameter != 1) {
              SelectedColor =
                  Color(int.parse(productProvider.productWithoutId.color));
            }
            _MinimumLimitEditingController.text =
                productProvider.productWithoutId.limit;
            _priceEditingController.text =
                productProvider.productWithoutId.price;
          }
          isSaving = false;
        });
      } on Failure catch (error) {
        showMessage(context, error.message, Colors.red);
        setState(() {
          isSaving = false;
        });
      } catch (error) {
        showMessage(
          context,
          widget.add ? AppStrings.dataNotAdded : AppStrings.dataNotUpdated,
          Colors.red,
        );
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: appMargin.m5, horizontal: appMargin.m12),
      child: Form(
          key: _ProductAddFormKey,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (productPageController.addFormat == 'Sub-Category')
                  Container(
                      width: double.infinity,
                      color: Colors.green,
                      padding: EdgeInsets.symmetric(
                          vertical: appPadding.p5, horizontal: appPadding.p10),
                      child: Text(
                        "${widget.add ? 'Add Product in ${productPageController.subCatName} of ${productPageController.categoryDetails.name}' : 'Update ${productPageController.productForUpdate.name} in ${productPageController.catHeading} of ${productPageController.categoryDetails.name}'}",
                        style: getRegulerStyle(
                            color: ColorManager.white, fontsize: FontSize.s14),
                      )),
                if (productPageController.addFormat == 'Further-Sub-Category')
                  Container(
                    width: double.infinity,
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(
                        vertical: appPadding.p5, horizontal: appPadding.p10),
                    child: Text(
                      "${widget.add ? 'Add product in ${productPageController.furtherSubCatName} ${productPageController.subCatName} of ${productPageController.categoryDetails.name}' : 'Update ${productPageController.productForUpdate.name} in ${productPageController.catHeading} of ${productPageController.subCatName}'}",
                      style: getRegulerStyle(
                          color: ColorManager.white, fontsize: FontSize.s14),
                    ),
                  ),
                Container(
                  width:
                      responsiveLayout.isTab(context) ? 600 : double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: appPadding.p10),
                                      child: Text(
                                        'Name',
                                        style: getMediumStyle(
                                            color: ColorManager.black,
                                            fontsize: FontSize.s16),
                                      ),
                                    ),
                                    TextFormField(
                                        controller: _nameEditingController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Product name can't be empty";
                                          }
                                        },
                                        onSaved: (value) {
                                          name = value!.trim();
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          isDense: true,
                                          hintText: 'Enter product name',
                                        ),
                                        style: getRegulerStyle(
                                            color: ColorManager.black,
                                            fontsize: FontSize.s14)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: appPadding.p10),
                                      child: Text(
                                        'Description',
                                        style: getMediumStyle(
                                            color: ColorManager.black,
                                            fontsize: FontSize.s16),
                                      ),
                                    ),
                                    TextFormField(
                                        controller: _desEditingController,
                                        validator: ((value) {
                                          if (value!.isEmpty) {
                                            return "product description can't be empty";
                                          }
                                          if (value.length < 8 &&
                                              value.isNotEmpty) {
                                            return "product description must have atleast 8 characters";
                                          }
                                        }),
                                        onSaved: (value) {
                                          des = value!.trim();
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          isDense: true,
                                          hintText: 'Enter product description',
                                        ),
                                        style: getRegulerStyle(
                                            color: ColorManager.black,
                                            fontsize: FontSize.s14)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: appPadding.p10),
                                      child: Text(
                                        'Image',
                                        style: getMediumStyle(
                                            color: ColorManager.black,
                                            fontsize: FontSize.s16),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: appPadding.p20),
                                      child: TextFormField(
                                          controller:
                                              _imageUrlEditingController,
                                          validator: ((value) {
                                            if (value!.isEmpty) {
                                              return "product imageUrl can't be empty";
                                            } else if (!(Uri.parse(value)
                                                .hasAbsolutePath)) {
                                              return "Please enter a valid image url";
                                            }
                                          }),
                                          onSaved: (value) {
                                            imageUrl = value!.trim();
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    loadImage = true;
                                                  });
                                                },
                                                icon: Icon(Icons.done)),
                                            isDense: true,
                                            hintText: 'Enter category imageurl',
                                          ),
                                          style: getRegulerStyle(
                                              color: ColorManager.black,
                                              fontsize: FontSize.s14)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        width: responsiveLayout.isPhone(context)
                                            ? double.infinity
                                            : 400,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(
                                                appSize.s12),
                                            border: Border.all(
                                                width: appSize.s2,
                                                color: ColorManager.lightGrey)),
                                        child: ((_imageUrlEditingController
                                                    .text.isEmpty) ||
                                                (!loadImage && widget.add))
                                            ? Container(
                                                decoration: BoxDecoration(
                                                  color: ColorManager.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          appSize.s12),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  'category image',
                                                  style: getRegulerStyle(
                                                      color: ColorManager.grey,
                                                      fontsize: FontSize.s15),
                                                )))
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        appSize.s12),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      _imageUrlEditingController
                                                          .text,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.fill,
                                                  errorWidget: (context, value,
                                                      dynamic) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            ColorManager.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    appSize
                                                                        .s12),
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.error,
                                                          color: ColorManager
                                                              .primery,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  placeholder:
                                                      (BuildContext context,
                                                          String value) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            ColorManager.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    appSize
                                                                        .s12),
                                                      ),
                                                      child: Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    );
                                                  },
                                                ))),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      if (responsiveLayout.isComputer(context))
                        SizedBox(
                          width: 100,
                        ),
                      if (responsiveLayout.isComputer(context))
                        Expanded(
                            flex: 5,
                            child: Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (productPageController.parameter != 1)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: appPadding.p10),
                                        child: Text(
                                          'Color',
                                          style: getMediumStyle(
                                              color: ColorManager.black,
                                              fontsize: FontSize.s16),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          if (SelectedColor !=
                                              Colors.transparent)
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: appPadding.p5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: SelectedColor,
                                                    shape: BoxShape.circle),
                                                width: 20,
                                                height: 20,
                                              ),
                                            ),
                                          if (SelectedColor !=
                                              Colors.transparent)
                                            SizedBox(
                                              width: 30,
                                            ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              appSize.s4))),
                                              onPressed: () {
                                                pickColor(context);
                                              },
                                              child: Text('Pick Color'))
                                        ],
                                      ),
                                    ],
                                  ),
                                if (productPageController.parameter == 3)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 19),
                                        child: Text(
                                          'Size',
                                          style: getMediumStyle(
                                              color: ColorManager.black,
                                              fontsize: FontSize.s16),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: appPadding.p10,
                                            top: appPadding.p10),
                                        child: TextFormField(
                                            controller: _numericSizeController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "size can't be empty";
                                              }
                                            },
                                            onSaved: (value) {
                                              size = value!.trim();
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              isDense: true,
                                              hintText: 'Enter size number',
                                            ),
                                            style: getRegulerStyle(
                                                color: ColorManager.black,
                                                fontsize: FontSize.s14)),
                                      ),
                                    ],
                                  ),
                                if (productPageController.parameter == 2)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 19),
                                        child: Text(
                                          'Size',
                                          style: getMediumStyle(
                                              color: ColorManager.black,
                                              fontsize: FontSize.s16),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: appPadding.p10, top: 11),
                                        child: SizedBox(
                                          height: 41,
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButtonFormField(
                                              value: defaultSizeDescriptiveItem,
                                              dropdownColor: Colors.white,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                              iconSize: 20,
                                              icon: Icon(Icons
                                                  .arrow_drop_down_circle_outlined),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              onSaved: (value) {
                                                selectedDescriptedSizeItem =
                                                    value.toString();
                                              },
                                              validator: (value) {
                                                if (value.toString().isEmpty) {
                                                  return "Size can't be Empty";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                contentPadding: EdgeInsets.only(
                                                    right: appPadding.p10),
                                              ),
                                              selectedItemBuilder:
                                                  (BuildContext context) {
                                                return sizeDescriptiveItems
                                                    .map((String value) {
                                                  return Text(
                                                    value,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  );
                                                }).toList();
                                              },
                                              items: sizeDescriptiveItems
                                                  .map((item) {
                                                return DropdownMenuItem(
                                                    value: item,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 0),
                                                      child: Text(
                                                        item,
                                                      ),
                                                    ));
                                              }).toList(),
                                              onChanged: (value) =>
                                                  setState(() {
                                                selectedDescriptedSizeItem =
                                                    value.toString();
                                              }),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                if ((productPageController.parameter != 3 ||
                                        productPageController.parameter != 4) &&
                                    productPageController.parameter != 1)
                                  SizedBox(
                                    height: 15,
                                  ),
                                if (productPageController.parameter == 3 ||
                                    productPageController.parameter == 4)
                                  SizedBox(
                                    height: 5,
                                  ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: appPadding.p10,
                                      bottom: appPadding.p10),
                                  child: productPageController.parameter == 1
                                      ? Text(
                                          'Limit Kg',
                                          style: getMediumStyle(
                                              color: ColorManager.black,
                                              fontsize: FontSize.s16),
                                        )
                                      : Text(
                                          'Limit',
                                          style: getMediumStyle(
                                              color: ColorManager.black,
                                              fontsize: FontSize.s16),
                                        ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: appPadding.p10),
                                  child: TextFormField(
                                      controller:
                                          _MinimumLimitEditingController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "minimum limit can't be empty";
                                        }
                                      },
                                      onSaved: (value) {
                                        limit = value!.trim();
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        isDense: true,
                                        hintText: 'Enter minimum limit',
                                      ),
                                      style: getRegulerStyle(
                                          color: ColorManager.black,
                                          fontsize: FontSize.s14)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: appPadding.p10),
                                  child: productPageController.parameter == 1
                                      ? Text(
                                          'Price Kg',
                                          style: getMediumStyle(
                                              color: ColorManager.black,
                                              fontsize: FontSize.s16),
                                        )
                                      : Text(
                                          'Price',
                                          style: getMediumStyle(
                                              color: ColorManager.black,
                                              fontsize: FontSize.s16),
                                        ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: appPadding.p10),
                                  child: TextFormField(
                                      controller: _priceEditingController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "price can't be empty";
                                        }
                                      },
                                      onSaved: (value) {
                                        price = value!.trim();
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        isDense: true,
                                        hintText: 'Enter product price',
                                      ),
                                      style: getRegulerStyle(
                                          color: ColorManager.black,
                                          fontsize: FontSize.s14)),
                                ),
                              ],
                            ))),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.topRight,
                    child: responsiveLayout.isPhone(context)
                        ? SizedBox(
                            width: double.infinity,
                            child: isSaving
                                ? Center(child: CircularProgressIndicator())
                                : ElevatedButtonWidget())
                        : isSaving
                            ? SizedBox(
                                width: appSize.s100,
                                child:
                                    Center(child: CircularProgressIndicator()))
                            : Padding(
                                padding: EdgeInsets.only(right: appPadding.p10),
                                child: ElevatedButtonWidget(),
                              )),
              ],
            ),
          )),
    );
  }

  Widget ElevatedButtonWidget() {
    return ElevatedButton.icon(
        onPressed: () {
          SubmitCatForm();
        },
        style: ElevatedButton.styleFrom(
            primary: ColorManager.primery,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    responsiveLayout.isPhone(context)
                        ? appSize.s6
                        : appSize.s4)),
            padding: EdgeInsets.symmetric(
                vertical: appPadding.p15, horizontal: appPadding.p20)),
        icon: Icon(
          widget.add ? Icons.add : Icons.edit,
          size: appSize.s20,
        ),
        label: Text(
          widget.add ? 'Add' : 'Edit',
          style:
              getMediumStyle(color: ColorManager.white, fontsize: FontSize.s18),
        ));
  }

  void pickColor(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Pick your color'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildColorPicker(),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          SelectedColor = Colors.transparent;
                        });
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.of(context).pop();
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: appPadding.p15),
                        child: Column(
                          children: [
                            Text(
                              'None',
                              style: getMediumStyle(
                                  color: ColorManager.primery,
                                  fontsize: FontSize.s20),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Close',
                        style: getMediumStyle(
                            color: ColorManager.white, fontsize: FontSize.s15),
                      )),
                ],
              ),
            ));
  }

  Widget buildColorPicker() {
    return BlockPicker(
        pickerColor: SelectedColor,
        onColorChanged: (color) => setState(() {
              SelectedColor = color;
            }));
  }
}
