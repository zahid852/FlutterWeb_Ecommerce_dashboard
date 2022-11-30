import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

import '../../Model/model.dart';

class UpdateFurtherSubCatProductUsecase
    implements BaseUseCase<UpdateFurtherSubCatProductInput, ProductWithoutId> {
  repositry _repositry;
  UpdateFurtherSubCatProductUsecase(this._repositry);

  @override
  Future<Either<Failure, ProductWithoutId>> execute(
      UpdateFurtherSubCatProductInput input) {
    return _repositry.updateFurtherSubCatProductRepositry(
        UpdateFurtherSubCatProductRequest(
            input.catId,
            input.subCatId,
            input.furtherSubCatId,
            input.furtherSubCatProId,
            input.name,
            input.des,
            input.url,
            input.color,
            input.size,
            input.limit,
            input.price));
  }
}

class UpdateFurtherSubCatProductInput {
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
  UpdateFurtherSubCatProductInput(
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
