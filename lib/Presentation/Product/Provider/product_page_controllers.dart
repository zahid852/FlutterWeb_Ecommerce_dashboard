import 'package:ecomerce_web/Data/mapper/mapper.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Presentation/Product/Components/add_product.dart';
import 'package:ecomerce_web/Presentation/Product/Components/cat_data.dart';
import 'package:ecomerce_web/Presentation/Product/ProductStock/add_stock.dart';
import 'package:ecomerce_web/Presentation/Product/ProductStock/all_stock.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductPageController extends ChangeNotifier {
  List<buttonInfo> ProductHeadings = [
    buttonInfo(
        title: 'All Data',
        icon: Icons.branding_watermark,
        selectedWidget: CatData()),
    buttonInfo(
        title: 'Add Product',
        icon: Icons.add,
        selectedWidget: AddProductData(true)),
  ];
  // List<buttonInfo> ProductStockHeadings = [
  //   buttonInfo(
  //       title: 'All Stock Info',
  //       icon: Icons.show_chart,
  //       selectedWidget: allStock()),
  //   buttonInfo(
  //       title: 'Add Stock', icon: Icons.add, selectedWidget: addStock(true)),
  // ];
  // int StockCurrentIndex = 0;
  // Widget StockWidget = allStock();
  late Category categoryDetails;
  bool CatPage = false;
  bool ProductPage = false;
  Product productForUpdate =
      Product(Empty, Empty, Empty, Empty, Empty, Empty, Empty, Empty);
  int currentIndex = 0;
  Widget ProductWidget = CatData();
  bool CatProduct = false;
  bool SubCatProduct = false;
  bool furtherSubCatProduct = false;
  int parameter = Zero;
  String addFormat = Empty;
  String allFormat = Empty;
  bool back = true;
  String subCatId = Empty;
  String furtherSubCatId = Empty;
  String subCatName = Empty;
  String furtherSubCatName = Empty;
  String catHeading = Empty;
  String cat = 'Category';
  String sub_cat = 'Sub-Category';
  String further_sub_cat = 'Further-Sub-Category';
  void addCategoryProduct() {
    addFormat = cat;
    parameter = categoryDetails.parameter;
  }

  void addSubCategoryProduct(SubCategory subCategory) {
    addFormat = sub_cat;
    parameter = subCategory.parameter;
    subCatId = subCategory.id;
    subCatName = subCategory.name;
  }

  void updateSubCatProduct(int index, Product product) {
    addFormat = sub_cat;
    currentIndex = index;

    ProductWidget = AddProductData(false);
    productForUpdate = product;
    addFormat = sub_cat;

    notifyListeners();
  }

  void updateCatProduct(int index, Product product) {
    addFormat = cat;
    currentIndex = index;

    ProductWidget = AddProductData(false);
    productForUpdate = product;
    addFormat = cat;

    notifyListeners();
  }

  void updateFurtherSubCatProduct(int index, Product product) {
    addFormat = sub_cat;
    currentIndex = index;
    addFormat = further_sub_cat;
    ProductWidget = AddProductData(false);
    productForUpdate = product;

    notifyListeners();
  }

  void goToSubCatProductsPage(String sub_catId, String sub_CatName, int para) {
    subCatId = sub_catId;
    allFormat = sub_cat;
    catHeading = sub_CatName;
    ProductPage = !ProductPage;
    parameter = para;
    back = true;
    SubCatProduct = true;
    CatProduct = false;
    furtherSubCatProduct = false;
    notifyListeners();
  }

  void goToCatProductsPage(int para) {
    allFormat = cat;
    catHeading = categoryDetails.name;
    ProductPage = !ProductPage;
    parameter = para;
    back = false;
    SubCatProduct = false;
    CatProduct = true;
    furtherSubCatProduct = false;
    notifyListeners();
  }

  void goToFurhterSubCatProductsPage(
    String fsub_catId,
    String fsub_CatName,
    String sub_catId,
    String sub_CatName,
    int para,
  ) {
    furtherSubCatId = fsub_catId;
    allFormat = further_sub_cat;
    catHeading = fsub_CatName;
    subCatId = sub_catId;
    subCatName = sub_CatName;
    ProductPage = !ProductPage;
    parameter = para;
    back = true;
    SubCatProduct = false;
    CatProduct = false;
    furtherSubCatProduct = true;
    notifyListeners();
  }

  void BackFromProductPage() {
    ProductPage = !ProductPage;
    notifyListeners();
  }

  void addFurtherSubCategoryProduct(
      Category category, String sub_catId, String subCat_name) {
    addFormat = further_sub_cat;
    parameter = category.parameter;
    furtherSubCatId = category.id;
    subCatId = sub_catId;
    subCatName = subCat_name;
    furtherSubCatName = category.name;
  }

  void changeProductPage(
    int index,
  ) {
    currentIndex = index;
    ProductWidget = ProductHeadings[index].selectedWidget ?? CatData();

    notifyListeners();
  }

  // void changeProductStockPage(
  //   int index,
  // ) {
  //   StockCurrentIndex = index;
  //   StockWidget = ProductStockHeadings[index].selectedWidget ?? allStock();

  //   notifyListeners();
  // }

  void changeToCatDetailPage(Category category) {
    CatPage = !CatPage;
    categoryDetails = category;
    parameter = category.parameter;
    addFormat = cat;

    notifyListeners();
  }

  void BackFromCatDetailPage() {
    CatPage = !CatPage;
    ProductPage = false;
    currentIndex = 0;
    ProductWidget = CatData();
    notifyListeners();
  }
}
