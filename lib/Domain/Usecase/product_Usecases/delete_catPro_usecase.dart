import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';

import '../../../Data/network/failure.dart';
import '../base_usecase.dart';

class DeleteCatProductUsecase
    implements BaseUseCase<DeleteCatProductInput, void> {
  repositry _repositry;
  DeleteCatProductUsecase(this._repositry);

  @override
  Future<Either<Failure, void>> execute(DeleteCatProductInput input) {
    return _repositry.deleteCatProductRepositry(
        DeleteCatProductRequest(input.catId, input.CatProId));
  }
}

class DeleteCatProductInput {
  String catId;
  String CatProId;

  DeleteCatProductInput(this.catId, this.CatProId);
}
