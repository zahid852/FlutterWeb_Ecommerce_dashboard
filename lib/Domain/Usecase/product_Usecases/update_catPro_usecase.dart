import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

import '../../Model/model.dart';

class UpdateCatProductUsecase
    implements BaseUseCase<UpdateCatProductInput, ProductWithoutId> {
  repositry _repositry;
  UpdateCatProductUsecase(this._repositry);

  @override
  Future<Either<Failure, ProductWithoutId>> execute(
      UpdateCatProductInput input) {
    return _repositry.updateCatProductRepositry(UpdateCatProductRequest(
        input.catId,
        input.CatProId,
        input.name,
        input.des,
        input.url,
        input.color,
        input.size,
        input.limit,
        input.price));
  }
}

class UpdateCatProductInput {
  String catId;
  String CatProId;
  String name;
  String des;
  String url;
  String color;
  String size;
  String limit;
  String price;
  UpdateCatProductInput(this.catId, this.CatProId, this.name, this.des,
      this.url, this.color, this.size, this.limit, this.price);
}
