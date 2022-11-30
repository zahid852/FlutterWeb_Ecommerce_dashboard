import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Components/add_subcat.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Components/all_subcat.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Components/category_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Domain/Model/model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SubCategoryPageControllers extends ChangeNotifier {
  String id_forUpate = Empty;
  String update_name = Empty;
  String update_des = Empty;
  String update_imageUrl = Empty;
  int update_parameter = Zero;
  bool FurtherSubCat = false;
  String FurtherSubCatId = Empty;
  String SubCategoryId = Empty;
  String SubCategoryName = Empty;
  int subParameter = Zero;
  List<buttonInfo> categoryHeadings = [
    buttonInfo(
        title: 'Category Details',
        icon: MdiIcons.details,
        selectedWidget: categoryDetails()),
    buttonInfo(
        title: 'Sub-Categories',
        icon: MdiIcons.tagMultiple,
        selectedWidget: allSubCat()),
    buttonInfo(
        title: 'Sub-Category',
        icon: Icons.add,
        selectedWidget: addSubCategory(true)),
  ];

  int currentIndex = 0;
  Widget catWidget = categoryDetails();
  void changeSubCategoryPage(int index,
      [bool further_subCat = false,
      String subCatId = Empty,
      String subCatName = Empty,
      int para = Zero]) {
    currentIndex = index;
    catWidget = categoryHeadings[index].selectedWidget ?? allSubCat();
    FurtherSubCat = further_subCat;
    SubCategoryId = subCatId;
    SubCategoryName = subCatName;
    subParameter = para;
    notifyListeners();
  }

  void updateSubCategory(
      int index, String id, String name, String des, String imageUrl, int para,
      [bool furtherSubCatUpdate = false,
      String furtherSubCatId = Empty,
      String subCatName = Empty]) {
    currentIndex = index;
    catWidget = addSubCategory(false);
    if (furtherSubCatUpdate) {
      FurtherSubCat = true;
      FurtherSubCatId = furtherSubCatId;
      SubCategoryName = subCatName;
    }
    id_forUpate = id;
    update_name = name;
    update_des = des;
    update_imageUrl = imageUrl;
    update_parameter = para;
    notifyListeners();
  }
}
