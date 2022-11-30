import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';
import 'package:flutter/animation.dart';
import '../../../Data/network/failure.dart';

class AddSubCatProductUsecase
    implements BaseUseCase<AddSubCatProductInput, AddProduct> {
  repositry _repositry;
  AddSubCatProductUsecase(this._repositry);

  @override
  Future<Either<Failure, AddProduct>> execute(AddSubCatProductInput input) {
    return _repositry.addSubCatProductRepositry(AddSubCatProductRequest(
        input.catId,
        input.subCatId,
        input.name,
        input.des,
        input.url,
        input.color,
        input.size,
        input.limit,
        input.price));
  }
}

class AddSubCatProductInput {
  String catId;
  String subCatId;
  String name;
  String des;
  String url;
  String color;
  String size;
  String limit;
  String price;
  AddSubCatProductInput(this.catId, this.subCatId, this.name, this.des,
      this.url, this.color, this.size, this.limit, this.price);
}
