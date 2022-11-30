import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Data/network/error_handler.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Usecase/category_Usecases/addcat_usecase.dart';
import 'package:ecomerce_web/Domain/Usecase/category_Usecases/updatecat_usecase.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/cat_provider.dart';
import 'package:ecomerce_web/Presentation/Category/Provider/category_page_controllers.dart';
import 'package:ecomerce_web/Presentation/Common/common_widgets.dart';
import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
import 'package:ecomerce_web/Presentation/resources/string_manager.dart';
import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
import 'package:ecomerce_web/Presentation/responsive/responsive_layout.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addCat extends StatefulWidget {
  bool add;
  addCat(this.add);
  @override
  State<addCat> createState() => _addCatState();
}

class _addCatState extends State<addCat> {
  final _CatAddFormKey = GlobalKey<FormState>();
  late CategoryPageControllers changeCategoryPageProvider;
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _desEditingController = TextEditingController();
  TextEditingController _imageUrlEditingController = TextEditingController();
  String category_id = Empty;
  String name = Empty;
  String des = Empty;
  String imageUrl = Empty;
  bool isSaving = false;
  bool isFormValid = false;
  bool loadImage = false;
  int currentParameterIndex = Zero;
  FirebaseDatabase database = FirebaseDatabase.instance;
  int checkParameter = Zero;
  @override
  void initState() {
    if (!widget.add) {
      changeCategoryPageProvider =
          Provider.of<CategoryPageControllers>(context, listen: false);
      category_id = changeCategoryPageProvider.id_forUpate;
      _nameEditingController.text = changeCategoryPageProvider.update_name;
      _desEditingController.text = changeCategoryPageProvider.update_des;
      _imageUrlEditingController.text =
          changeCategoryPageProvider.update_imageUrl;
      currentParameterIndex = changeCategoryPageProvider.update_parameter;
      checkParameter = currentParameterIndex;
    }
    super.initState();
  }

  changeParameter(int ind) {
    setState(() {
      currentParameterIndex = ind;
    });
  }

  void SubmitCatForm() async {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    isFormValid = _CatAddFormKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isFormValid) {
      _CatAddFormKey.currentState!.save();
      try {
        setState(() {
          isSaving = true;
        });
        if (widget.add)
          await categoryProvider.addCatData(
              CatAddInput(name, des, imageUrl, currentParameterIndex));
        if (!widget.add) {
          DatabaseEvent snapshot = await database
              .ref("product/${category_id}")
              .orderByChild('pro_name')
              .once();
          if (snapshot.snapshot.exists &&
              checkParameter != currentParameterIndex) {
            showMessage(context, AppStrings.parameter_error, Colors.red);
            setState(() {
              isSaving = false;
            });
            return;
          }
          await categoryProvider.updateCatData(CatUpdateInput(
              category_id, name, des, imageUrl, currentParameterIndex));
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
            currentParameterIndex = Zero;
            loadImage = false;
          }
          if (!widget.add) {
            _nameEditingController.text = categoryProvider.name;
            _desEditingController.text = categoryProvider.des;
            _imageUrlEditingController.text = categoryProvider.imageUrl;
            currentParameterIndex = categoryProvider.parameter;
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

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
            vertical: appMargin.m5, horizontal: appMargin.m12),
        child: Form(
            key: _CatAddFormKey,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width:
                        responsiveLayout.isTab(context) ? 600 : double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              return "category name can't be empty";
                                            }
                                          },
                                          onSaved: (value) {
                                            name = value!.trim();
                                          },
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            isDense: true,
                                            hintText: 'Enter category name',
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
                                              return "category description can't be empty";
                                            }
                                            if (value.length < 8 &&
                                                value.isNotEmpty) {
                                              return "category description must have atleast 8 characters";
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
                                                'Enter category description',
                                          ),
                                          style: getRegulerStyle(
                                              color: ColorManager.black,
                                              fontsize: FontSize.s14)),
                                    ],
                                  ),
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
                                                return "category imageUrl can't be empty";
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
                                                  'Enter category imageurl',
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
                                                    'category image',
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
                                  : ElevatedButtonWidget())
                          : isSaving
                              ? SizedBox(
                                  width: appSize.s100,
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : ElevatedButtonWidget())
                ],
              ),
            )));
  }
}
