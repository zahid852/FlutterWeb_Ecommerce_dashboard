import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

import '../../Model/model.dart';

class AllFurtherSubCatProductUsecase
    implements BaseUseCase<AllFurtherSubCatProductInput, List<Product>> {
  repositry _repositry;
  AllFurtherSubCatProductUsecase(this._repositry);

  @override
  Future<Either<Failure, List<Product>>> execute(
      AllFurtherSubCatProductInput allFurtherSubCatProductInput) {
    return _repositry.allFurtherSubCatProductRepositry(
        FurtherSubCatProductRequest(
            allFurtherSubCatProductInput.catId,
            allFurtherSubCatProductInput.subCatId,
            allFurtherSubCatProductInput.furtherSubCatId));
  }
}

class AllFurtherSubCatProductInput {
  String catId;
  String subCatId;
  String furtherSubCatId;

  AllFurtherSubCatProductInput(this.catId, this.subCatId, this.furtherSubCatId);
}
