import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Data/network/error_handler.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Usecase/furthersubcategory_usecase/addfurthersubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/furthersubcategory_usecase/updatefurthersubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/subcategory_usecase/addsubcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/subcategory_usecase/updatesubcat_usecase.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/category_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Common/common_widgets.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_page_controllers.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Provider/subcat_provider.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/string_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:ecomerce_web/Presentation/responsive/responsive_layout.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addSubCategory extends StatefulWidget {
  bool add;
  addSubCategory(this.add);
  @override
  State<addSubCategory> createState() => _addSubCategoryState();
}

class _addSubCategoryState extends State<addSubCategory> {
  final _SubCatAddFormKey = GlobalKey<FormState>();
  late SubCategoryPageControllers subCategoryPageControllers;
  late CategoryPageControllers categoryPageControllers;
  late SubCategoryProvider subcategoryProvider =
      Provider.of<SubCategoryProvider>(context, listen: false);
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _desEditingController = TextEditingController();
  TextEditingController _imageUrlEditingController = TextEditingController();

  String sub_category_id = Empty;
  String further_SubCategory_id = Empty;
  String name = Empty;
  String des = Empty;
  String imageUrl = Empty;
  int currentParameterIndex = Zero;
  bool isSaving = false;
  bool isFormValid = false;
  bool loadImage = false;
  bool parameterVerify = true;
  int checkParameter = Zero;
  FirebaseDatabase firebase = FirebaseDatabase.instance;
  @override
  void initState() {
    categoryPageControllers =
        Provider.of<CategoryPageControllers>(context, listen: false);
    subCategoryPageControllers =
        Provider.of<SubCategoryPageControllers>(context, listen: false);
    if (widget.add && !subCategoryPageControllers.FurtherSubCat) {
      currentParameterIndex = categoryPageControllers.categoryDetails.parameter;
    }
    if (widget.add && subCategoryPageControllers.FurtherSubCat) {
      currentParameterIndex = subCategoryPageControllers.subParameter;
    }
    if (!widget.add) {
      if (subCategoryPageControllers.FurtherSubCat) {
        further_SubCategory_id = subCategoryPageControllers.FurtherSubCatId;
      }
      sub_category_id = subCategoryPageControllers.id_forUpate;
      _nameEditingController.text = subCategoryPageControllers.update_name;
      _desEditingController.text = subCategoryPageControllers.update_des;
      _imageUrlEditingController.text =
          subCategoryPageControllers.update_imageUrl;
      currentParameterIndex = subCategoryPageControllers.update_parameter;
      checkParameter = currentParameterIndex;
    }
    super.initState();
  }

  changeParameter(int ind) {
    setState(() {
      currentParameterIndex = ind;
    });
  }

  Widget radioButton() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: appPadding.p10, horizontal: 24),
            child: Text(
              'Parameter',
              style: getMediumStyle(
                  color: ColorManager.black, fontsize: FontSize.s16),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(appSize.s12),
            ),
            child: Column(
              children: [
                Container(
                  child: Center(
                    child: RadioListTile(
                        activeColor: ColorManager.primery,
                        title: Text(
                          'Fixed',
                          style: getRegulerStyle(
                              color: currentParameterIndex == 0
                                  ? ColorManager.primery
                                  : Colors.black,
                              fontsize: FontSize.s15),
                        ),
                        value: 0,
                        groupValue: currentParameterIndex,
                        onChanged: (value) {
                          changeParameter(value as int);
                        }),
                  ),
                ),
                Container(
                  child: Center(
                    child: RadioListTile(
                        activeColor: ColorManager.primery,
                        title: Text(
                          'Grams & Kg',
                          style: getRegulerStyle(
                              color: currentParameterIndex == 1
                                  ? ColorManager.primery
                                  : Colors.black,
                              fontsize: FontSize.s15),
                        ),
                        value: 1,
                        groupValue: currentParameterIndex,
                        onChanged: (value) {
                          changeParameter(value as int);
                        }),
                  ),
                ),
                Container(
                  child: Center(
                    child: RadioListTile(
                        activeColor: ColorManager.primery,
                        title: Text(
                          'Color & Descriptive Size',
                          style: getRegulerStyle(
                              color: currentParameterIndex == 2
                                  ? ColorManager.primery
                                  : Colors.black,
                              fontsize: FontSize.s15),
                        ),
                        value: 2,
                        groupValue: currentParameterIndex,
                        onChanged: (value) {
                          changeParameter(value as int);
                        }),
                  ),
                ),
                Container(
                  child: Center(
                    child: RadioListTile(
                        activeColor: ColorManager.primery,
                        title: Text(
                          'Color & Numeric Size',
                          style: getRegulerStyle(
                              color: currentParameterIndex == 3
                                  ? ColorManager.primery
                                  : Colors.black,
                              fontsize: FontSize.s15),
                        ),
                        value: 3,
                        groupValue: currentParameterIndex,
                        onChanged: (value) {
                          changeParameter(value as int);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void SubmitSubCatForm() async {
    isFormValid = _SubCatAddFormKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isFormValid) {
      _SubCatAddFormKey.currentState!.save();
      try {
        setState(() {
          isSaving = true;
        });
        if (!subCategoryPageControllers.FurtherSubCat) {
          if (widget.add) {
            await subcategoryProvider.addSubCatData(SubCatAddInput(
                categoryPageControllers.categoryDetails.id,
                name,
                des,
                imageUrl,
                currentParameterIndex));
          }
          if (!widget.add) {
            DatabaseEvent snapshot = await firebase
                .ref(
                    "product/${categoryPageControllers.categoryDetails.id}/${sub_category_id}")
                .orderByChild('s_pro_name')
                .once();
            if (snapshot.snapshot.exists &&
                checkParameter != currentParameterIndex) {
              showMessage(context, AppStrings.parameter_error, Colors.red);
              setState(() {
                isSaving = false;
              });
              return;
            }
            await subcategoryProvider.updateSubCatData(SubCatUpdateInput(
                categoryPageControllers.categoryDetails.id,
                sub_category_id,
                name,
                des,
                imageUrl,
                currentParameterIndex));
          }
        }
        if (subCategoryPageControllers.FurtherSubCat) {
          if (widget.add) {
            parameterVerify = true;
            await subcategoryProvider.addFurtherSubCatData(
                FurtherSubCatAddInput(
                    categoryPageControllers.categoryDetails.id,
                    subCategoryPageControllers.SubCategoryId,
                    name,
                    des,
                    imageUrl,
                    currentParameterIndex));
          }
          if (!widget.add) {
            DatabaseEvent snapshot = await firebase
                .ref(
                    "product/${categoryPageControllers.categoryDetails.id}/${sub_category_id}/${further_SubCategory_id}")
                .orderByChild('fsc_pro_name')
                .once();
            if (snapshot.snapshot.exists &&
                checkParameter != currentParameterIndex) {
              showMessage(context, AppStrings.parameter_error, Colors.red);
              setState(() {
                isSaving = false;
              });
              return;
            }
            await subcategoryProvider.updateFurtherSubCatData(
                FurtherSubCatUpdateInput(
                    categoryPageControllers.categoryDetails.id,
                    sub_category_id,
                    further_SubCategory_id,
                    name,
                    des,
                    imageUrl,
                    currentParameterIndex));
          }
        }

        showMessage(
            context,
            widget.add ? AppStrings.dataAdded : AppStrings.dataUpdated,
            Colors.green);
        setState(() {
          name = Empty;
          des = Empty;
          imageUrl = Empty;
          if (widget.add) {
            _nameEditingController.clear();
            _desEditingController.clear();
            _imageUrlEditingController.clear();
            if (!subCategoryPageControllers.FurtherSubCat) {
              currentParameterIndex =
                  categoryPageControllers.categoryDetails.parameter;
            }
            if (subCategoryPageControllers.FurtherSubCat) {
              currentParameterIndex = subCategoryPageControllers.subParameter;
            }
            loadImage = false;
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

  Widget ElevatedButtonWidget(bool value) {
    return ElevatedButton.icon(
        onPressed: () {
          SubmitSubCatForm();
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

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(
            appMargin.m12, appMargin.m5, appMargin.m12, 0),
        child: Form(
            key: _SubCatAddFormKey,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Consumer<SubCategoryPageControllers>(
                  builder: ((context, subCatPageData, child) {
                subCategoryPageControllers = subCatPageData;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (subCatPageData.FurtherSubCat)
                      Container(
                        width: double.infinity,
                        color: Colors.green,
                        padding: EdgeInsets.symmetric(
                            vertical: appPadding.p5,
                            horizontal: appPadding.p10),
                        child: Text(
                          '${widget.add ? 'Add Further Sub-Category' : 'Update ${subCategoryPageControllers.update_name}'} in the ${subCategoryPageControllers.SubCategoryName} of ${categoryPageControllers.categoryDetails.name}',
                          style: getRegulerStyle(
                              color: ColorManager.white,
                              fontsize: FontSize.s14),
                        ),
                      ),
                    Container(
                      width: responsiveLayout.isTab(context)
                          ? 600
                          : double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                Column(
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
                                            return "sub-category name can't be empty";
                                          }
                                        },
                                        onSaved: (value) {
                                          name = value!.trim();
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          isDense: true,
                                          hintText: 'Enter sub-category name',
                                        ),
                                        style: getRegulerStyle(
                                            color: ColorManager.black,
                                            fontsize: FontSize.s14)),
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
                                            return "subcategory description can't be empty";
                                          }
                                          if (value.length < 8 &&
                                              value.isNotEmpty) {
                                            return "subcategory description must have atleast 8 characters";
                                          }
                                        }),
                                        onSaved: (value) {
                                          des = value!.trim();
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          isDense: true,
                                          hintText:
                                              'Enter sub-category description',
                                        ),
                                        style: getRegulerStyle(
                                            color: ColorManager.black,
                                            fontsize: FontSize.s14)),
                                  ],
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                return "sub-category imageUrl can't be empty";
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
                                              hintText:
                                                  'Enter sub-category imageurl',
                                            ),
                                            style: getRegulerStyle(
                                                color: ColorManager.black,
                                                fontsize: FontSize.s14)),
                                      ),
                                      Container(
                                          width:
                                              responsiveLayout.isPhone(context)
                                                  ? double.infinity
                                                  : 400,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      appSize.s12),
                                              border: Border.all(
                                                  width: appSize.s2,
                                                  color:
                                                      ColorManager.lightGrey)),
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
                                                    'sub-category image',
                                                    style: getRegulerStyle(
                                                        color:
                                                            ColorManager.grey,
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
                                                    errorWidget: (context,
                                                        value, dynamic) {
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorManager
                                                              .white,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorManager
                                                              .white,
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
                          if (responsiveLayout.isComputer(context))
                            SizedBox(
                              width: appSize.s50,
                            ),
                          if (responsiveLayout.isComputer(context))
                            Expanded(flex: 3, child: radioButton()),
                        ],
                      ),
                    ),
                    if (!responsiveLayout.isComputer(context))
                      Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          radioButton(),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    Container(
                        alignment: Alignment.topRight,
                        child: responsiveLayout.isPhone(context)
                            ? SizedBox(
                                width: double.infinity,
                                child: isSaving
                                    ? Center(child: CircularProgressIndicator())
                                    : ElevatedButtonWidget(true))
                            : isSaving
                                ? SizedBox(
                                    width: appSize.s100,
                                    child: Center(
                                        child: CircularProgressIndicator()))
                                : ElevatedButtonWidget(true)),
                    // if (responsiveLayout.isPhone(context))
                    //   SizedBox(
                    //     height: 20,
                    //   ),
                    // if (responsiveLayout.isPhone(context))
                    //   Container(
                    //       alignment: Alignment.topRight,
                    //       child: SizedBox(
                    //           width: double.infinity,
                    //           child: ElevatedButtonWidget(false)))
                  ],
                );
              })),
            )));
  }
}
