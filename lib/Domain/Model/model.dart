import 'package:ecomerce_web/Data/responses/response.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Presentation/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';

class buttonInfo {
  final String title;
  IconData? icon;
  Widget? selectedWidget;
  buttonInfo({required this.title, this.icon, this.selectedWidget});
}

class AddCategory {
  String id;
  AddCategory(this.id);
}

class Category {
  String id;
  String name;
  String des;
  String imageUrl;
  int parameter;
  Category(this.id, this.name, this.des, this.imageUrl, this.parameter);
}

class SubCategory {
  String id;
  String name;
  String des;
  String imageUrl;
  int parameter;
  List<Category> categoryList;
  SubCategory(this.id, this.name, this.des, this.imageUrl, this.parameter,
      this.categoryList);
}

class CategoryWithoutId {
  String name;
  String des;
  String imageUrl;
  int parameter;
  CategoryWithoutId(this.name, this.des, this.imageUrl, this.parameter);
}

class AddSubCategory {
  String id;
  AddSubCategory(this.id);
}

class AddProduct {
  String id;
  AddProduct(this.id);
}

class Product {
  String pro_id;
  String name;
  String des;
  String image;
  String color;
  String size;
  String limit;
  String price;
  Product(this.pro_id, this.name, this.des, this.image, this.color, this.size,
      this.limit, this.price);
}

class ProductWithoutId {
  String name;
  String des;
  String image;
  String color;
  String size;
  String limit;
  String price;
  ProductWithoutId(this.name, this.des, this.image, this.color, this.size,
      this.limit, this.price);
}
