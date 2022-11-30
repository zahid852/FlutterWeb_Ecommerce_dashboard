// import 'package:ecomerce_web/Data/mapper/mapper.dart';
// import 'package:ecomerce_web/Data/network/failure.dart';
// import 'package:ecomerce_web/Presentation/Category/Provider/cat_provider.dart';
// import 'package:ecomerce_web/Presentation/Common/common_widgets.dart';
// import 'package:ecomerce_web/Presentation/Product/Provider/product_page_controllers.dart';
// import 'package:ecomerce_web/Presentation/Product/Provider/product_provider.dart';
// import 'package:ecomerce_web/Presentation/resources/color_manager.dart';
// import 'package:ecomerce_web/Presentation/resources/font_manager.dart';
// import 'package:ecomerce_web/Presentation/resources/string_manager.dart';
// import 'package:ecomerce_web/Presentation/resources/style_manager.dart';
// import 'package:ecomerce_web/Presentation/resources/values_manager.dart';
// import 'package:ecomerce_web/Presentation/responsive/responsive_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class addStock extends StatefulWidget {
//   bool add;
//   addStock(this.add);
//   @override
//   State<addStock> createState() => _addStockState();
// }

// class _addStockState extends State<addStock> {
//   final _StockAddFormKey = GlobalKey<FormState>();
//   late ProductPageController productPageController;
//   TextEditingController _CreateEditingController = TextEditingController();
//   TextEditingController _desEditingController = TextEditingController();
//   TextEditingController _imageUrlEditingController = TextEditingController();
//   String proStock_id = Empty;
//   String name = Empty;
//   String des = Empty;
//   String imageUrl = Empty;
//   bool isSaving = false;
//   bool isFormValid = false;

//   @override
//   void initState() {
//     if (!widget.add) {
//       //  =
//       // Provider.of<ProductProvider>(context, listen: false);
//       // category_id = changeCategoryPageProvider.id_forUpate;
//       // _nameEditingController.text = changeCategoryPageProvider.update_name;
//       // _desEditingController.text = changeCategoryPageProvider.update_des;
//       // _imageUrlEditingController.text =
//       //     changeCategoryPageProvider.update_imageUrl;
//       // currentParameterIndex = changeCategoryPageProvider.update_parameter;
//     }
//     super.initState();
//   }

//   changeParameter(int ind) {
//     setState(() {
//       currentParameterIndex = ind;
//     });
//   }

//   void SubmitProductStockForm() async {
//     // final categoryProvider =
//     //     Provider.of<CategoryProvider>(context, listen: false);
//     isFormValid = _StockAddFormKey.currentState!.validate();
//     FocusScope.of(context).unfocus();
//     if (isFormValid) {
//       _StockAddFormKey.currentState!.save();
//       try {
//         setState(() {
//           isSaving = true;
//         });
//         // if (widget.add)
//         //   await categoryProvider.addCatData(
//         //       CatAddInput(name, des, imageUrl, currentParameterIndex));
//         // if (!widget.add)
//         //   await categoryProvider.updateCatData(CatUpdateInput(
//         //       category_id, name, des, imageUrl, currentParameterIndex));
//         showMessage(
//             context,
//             widget.add ? AppStrings.dataAdded : AppStrings.dataUpdated,
//             Colors.green);
//         setState(() {
//           name = Empty;
//           des = Empty;
//           imageUrl = Empty;
//           if (widget.add) {
//             _nameEditingController.clear();
//             _desEditingController.clear();
//             _imageUrlEditingController.clear();
//             currentParameterIndex = Zero;
//             loadImage = false;
//           }
//           // if (!widget.add) {
//           //   _nameEditingController.text = categoryProvider.name;
//           //   _desEditingController.text = categoryProvider.des;
//           //   _imageUrlEditingController.text = categoryProvider.imageUrl;
//           //   currentParameterIndex = categoryProvider.parameter;
//           // }
//           isSaving = false;
//         });
//       } on Failure catch (error) {
//         showMessage(context, error.message, Colors.red);
//         setState(() {
//           isSaving = false;
//         });
//       } catch (error) {
//         showMessage(
//           context,
//           widget.add ? AppStrings.dataNotAdded : AppStrings.dataNotUpdated,
//           Colors.red,
//         );
//         setState(() {
//           isSaving = false;
//         });
//       }
//     }
//   }

//   Widget ElevatedButtonWidget() {
//     return ElevatedButton.icon(
//         onPressed: () {
//           SubmitProductStockForm();
//         },
//         style: ElevatedButton.styleFrom(
//             primary: ColorManager.primery,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(
//                     responsiveLayout.isPhone(context)
//                         ? appSize.s6
//                         : appSize.s4)),
//             padding: EdgeInsets.symmetric(
//                 vertical: appPadding.p15, horizontal: appPadding.p20)),
//         icon: Icon(
//           widget.add ? Icons.add : Icons.edit,
//           size: appSize.s20,
//         ),
//         label: Text(
//           widget.add ? 'Add' : 'Edit',
//           style:
//               getMediumStyle(color: ColorManager.white, fontsize: FontSize.s18),
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: const EdgeInsets.symmetric(
//             vertical: appMargin.m5, horizontal: appMargin.m12),
//         child: Form(
//             key: _StockAddFormKey,
//             child: SingleChildScrollView(
//               controller: ScrollController(),
//               child: Container(
//                 width: responsiveLayout.isTab(context) ? 600 : double.infinity,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: appPadding.p10),
//                       child: Text(
//                         'Name',
//                         style: getMediumStyle(
//                             color: ColorManager.black, fontsize: FontSize.s16),
//                       ),
//                     ),
//                     Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding:
//                                 EdgeInsets.symmetric(vertical: appPadding.p10),
//                             child: Text(
//                               'Image',
//                               style: getMediumStyle(
//                                   color: ColorManager.black,
//                                   fontsize: FontSize.s16),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(bottom: appPadding.p20),
//                             child: TextFormField(
//                                 controller: _imageUrlEditingController,
//                                 validator: ((value) {
//                                   if (value!.isEmpty) {
//                                     return "category imageUrl can't be empty";
//                                   } else if (!(Uri.parse(value)
//                                       .hasAbsolutePath)) {
//                                     return "Please enter a valid image url";
//                                   }
//                                 }),
//                                 onSaved: (value) {
//                                   imageUrl = value!.trim();
//                                 },
//                                 decoration: InputDecoration(
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   suffixIcon: IconButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           loadImage = true;
//                                         });
//                                       },
//                                       icon: Icon(Icons.done)),
//                                   isDense: true,
//                                   hintText: 'Enter category imageurl',
//                                 ),
//                                 style: getRegulerStyle(
//                                     color: ColorManager.black,
//                                     fontsize: FontSize.s14)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                         alignment: Alignment.topRight,
//                         child: responsiveLayout.isPhone(context)
//                             ? SizedBox(
//                                 width: double.infinity,
//                                 child: isSaving
//                                     ? Center(child: CircularProgressIndicator())
//                                     : ElevatedButtonWidget())
//                             : isSaving
//                                 ? SizedBox(
//                                     width: appSize.s100,
//                                     child: Center(
//                                         child: CircularProgressIndicator()))
//                                 : ElevatedButtonWidget())
//                   ],
//                 ),
//               ),
//             )));
//   }
// }
