import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Presentation/SubCategory/Components/add_subcat.dart';
import 'package:ecomerce_web/Presentation/Category/components/add_cat.dart';
import 'package:ecomerce_web/Presentation/Category/components/all_cat.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../Domain/Model/model.dart';

class CategoryPageControllers extends ChangeNotifier {
  String id_forUpate = Empty;
  String update_name = Empty;
  String update_des = Empty;
  String update_imageUrl = Empty;
  int update_parameter = Zero;
  late Category categoryDetails;
  bool SubCatPage = false;
  List<buttonInfo> categoryHeadings = [
    buttonInfo(
        title: 'All Categories', icon: MdiIcons.tag, selectedWidget: allCat()),
    buttonInfo(
        title: 'Add Category', icon: Icons.add, selectedWidget: addCat(true)),
  ];

  int currentIndex = 0;
  Widget catWidget = allCat();
  void changeCategoryPage(int index) {
    currentIndex = index;
    catWidget = categoryHeadings[index].selectedWidget ?? allCat();
    notifyListeners();
  }

  void updateCategory(int index, String id, String name, String des,
      String imageUrl, int parameter) {
    currentIndex = index;
    catWidget = addCat(false);
    id_forUpate = id;
    update_name = name;
    update_des = des;
    update_imageUrl = imageUrl;
    update_parameter = parameter;
    notifyListeners();
  }

  void changeToCatDetailPage(Category category) {
    SubCatPage = !SubCatPage;
    categoryDetails = category;

    notifyListeners();
  }

  void BackFromCatDetailPage() {
    SubCatPage = !SubCatPage;
    notifyListeners();
  }
}
