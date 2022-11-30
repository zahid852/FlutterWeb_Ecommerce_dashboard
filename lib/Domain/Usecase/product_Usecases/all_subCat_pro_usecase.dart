import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

import '../../Model/model.dart';

class AllSubCatProductUsecase
    implements BaseUseCase<AllSubCatProductInput, List<Product>> {
  repositry _repositry;
  AllSubCatProductUsecase(this._repositry);

  @override
  Future<Either<Failure, List<Product>>> execute(
      AllSubCatProductInput allSubCatProductInput) {
    return _repositry.allSubCatProductRepositry(SubCatProductRequest(
        allSubCatProductInput.catId, allSubCatProductInput.subCatId));
  }
}

class AllSubCatProductInput {
  String catId;
  String subCatId;

  AllSubCatProductInput(
    this.catId,
    this.subCatId,
  );
}
