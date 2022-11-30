import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

import '../../../Data/network/failure.dart';
import '../../Model/model.dart';

class UpdateSubCatProductUsecase
    implements BaseUseCase<UpdateSubCatProductInput, ProductWithoutId> {
  repositry _repositry;
  UpdateSubCatProductUsecase(this._repositry);

  @override
  Future<Either<Failure, ProductWithoutId>> execute(
      UpdateSubCatProductInput input) {
    return _repositry.updateSubCatProductRepositry(UpdateSubCatProductRequest(
        input.catId,
        input.subCatId,
        input.subCatProId,
        input.name,
        input.des,
        input.url,
        input.color,
        input.size,
        input.limit,
        input.price));
  }
}

class UpdateSubCatProductInput {
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
  UpdateSubCatProductInput(
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
