import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

import '../../../Data/network/failure.dart';
import '../../Model/model.dart';

class AllCatProductUsecase
    implements BaseUseCase<AllCatProductInput, List<Product>> {
  repositry _repositry;
  AllCatProductUsecase(this._repositry);

  @override
  Future<Either<Failure, List<Product>>> execute(
      AllCatProductInput allCatProductInput) {
    return _repositry
        .allCatProductRepositry(CatProductRequest(allCatProductInput.catId));
  }
}

class AllCatProductInput {
  String catId;

  AllCatProductInput(
    this.catId,
  );
}
