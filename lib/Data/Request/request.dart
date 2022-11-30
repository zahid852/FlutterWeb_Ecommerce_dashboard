import 'package:flutter/animation.dart';

class CatAddRequest {
  String name;
  String des;
  String url;
  int parameter;
  CatAddRequest(this.name, this.des, this.url, this.parameter);
}

class CatUpdateRequest {
  String id;
  String name;
  String des;
  String url;
  int parameter;
  CatUpdateRequest(this.id, this.name, this.des, this.url, this.parameter);
}

class CatDeleteRequest {
  String id;

  CatDeleteRequest(this.id);
}

class SubCatAddRequest {
  String id;
  String name;
  String des;
  String url;
  int parameter;
  SubCatAddRequest(this.id, this.name, this.des, this.url, this.parameter);
}

class CatIdRequest {
  String id;

  CatIdRequest(this.id);
}

class SubCatUpdateRequest {
  String catId;
  String subCatId;
  String name;
  String des;
  String url;
  int parameter;
  SubCatUpdateRequest(
      this.catId, this.subCatId, this.name, this.des, this.url, this.parameter);
}

class SubCatDeleteRequest {
  String CatId;
  String SubCatId;

  SubCatDeleteRequest(this.CatId, this.SubCatId);
}

class FurtherSubCatAddRequest {
  String CatId;
  String SubCatId;
  String name;
  String des;
  String url;
  int parameter;
  FurtherSubCatAddRequest(
      this.CatId, this.SubCatId, this.name, this.des, this.url, this.parameter);
}

class FurtherSubCatUpdateRequest {
  String catId;
  String subCatId;
  String furtherSubCatId;
  String name;
  String des;
  String url;
  int parameter;
  FurtherSubCatUpdateRequest(this.catId, this.subCatId, this.furtherSubCatId,
      this.name, this.des, this.url, this.parameter);
}

class FurtherSubCatDeleteRequest {
  String CatId;
  String SubCatId;
  String FurtherSubCatId;

  FurtherSubCatDeleteRequest(this.CatId, this.SubCatId, this.FurtherSubCatId);
}

class AddSubCatProductRequest {
  String catId;
  String subCatId;
  String name;
  String des;
  String url;
  String color;
  String size;
  String limit;
  String price;

  AddSubCatProductRequest(this.catId, this.subCatId, this.name, this.des,
      this.url, this.color, this.size, this.limit, this.price);
}

class UpdateSubCatProductRequest {
  String catId;
  String subCatId;
  String subCatProId;
  String name;
  String des;
  String url;
  String color;
  String size;
  String limit;
  String price;

  UpdateSubCatProductRequest(
      this.catId,
      this.subCatId,
      this.subCatProId,
      this.name,
      this.des,
      this.url,
      this.color,
      this.size,
      this.limit,
      this.price);
}

class UpdateCatProductRequest {
  String catId;
  String CatProId;
  String name;
  String des;
  String url;
  String color;
  String size;
  String limit;
  String price;

  UpdateCatProductRequest(this.catId, this.CatProId, this.name, this.des,
      this.url, this.color, this.size, this.limit, this.price);
}

class DeleteSubCatProductRequest {
  String catId;
  String subCatId;
  String subCatProId;

  DeleteSubCatProductRequest(this.catId, this.subCatId, this.subCatProId);
}

class DeleteCatProductRequest {
  String catId;
  String CatProId;

  DeleteCatProductRequest(this.catId, this.CatProId);
}

class DeleteFurtherSubCatProductRequest {
  String catId;
  String subCatId;
  String FurtherSubCatId;
  String furtherSubCatProId;

  DeleteFurtherSubCatProductRequest(
      this.catId, this.subCatId, this.FurtherSubCatId, this.furtherSubCatProId);
}

class UpdateFurtherSubCatProductRequest {
  String catId;
  String subCatId;
  String furtherSubCatId;
  String furtherSubCatProId;
  String name;
  String des;
  String url;
  String color;
  String size;
  String limit;
  String price;

  UpdateFurtherSubCatProductRequest(
      this.catId,
      this.subCatId,
      this.furtherSubCatId,
      this.furtherSubCatProId,
      this.name,
      this.des,
      this.url,
      this.color,
      this.size,
      this.limit,
      this.price);
}

class AddFurtherSubCatProductRequest {
  String catId;
  String subCatId;
  String furtherSubCatId;
  String name;
  String des;
  String url;
  String color;
  String size;
  String limit;
  String price;

  AddFurtherSubCatProductRequest(
      this.catId,
      this.subCatId,
      this.furtherSubCatId,
      this.name,
      this.des,
      this.url,
      this.color,
      this.size,
      this.limit,
      this.price);
}

class AddCatProductRequest {
  String catId;
  String name;
  String des;
  String url;
  String color;
  String size;
  String limit;
  String price;

  AddCatProductRequest(this.catId, this.name, this.des, this.url, this.color,
      this.size, this.limit, this.price);
}

class SubCatProductRequest {
  String catId;
  String subCatId;
  SubCatProductRequest(this.catId, this.subCatId);
}

class FurtherSubCatProductRequest {
  String catId;
  String subCatId;
  String furtherSubCatId;
  FurtherSubCatProductRequest(this.catId, this.subCatId, this.furtherSubCatId);
}

class CatProductRequest {
  String catId;

  CatProductRequest(this.catId);
}
