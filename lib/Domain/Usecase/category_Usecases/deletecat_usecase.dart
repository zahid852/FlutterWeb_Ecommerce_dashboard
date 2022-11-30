import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

class DeleteCatUsecase implements BaseUseCase<CatDeleteInput, void> {
  repositry _repositry;
  DeleteCatUsecase(this._repositry);

  @override
  Future<Either<Failure, void>> execute(CatDeleteInput input) {
    return _repositry.deleteCatRepositry(CatDeleteRequest(input.id));
  }

  @override
  Future<Either<Failure, void>> executeCatSub(CatDeleteInput input) {
    return _repositry.deleteCatSubRepositry(CatDeleteRequest(input.id));
  }

  @override
  Future<Either<Failure, void>> executeCatPro(CatDeleteInput input) {
    return _repositry.deleteCatProRepositry(CatDeleteRequest(input.id));
  }
}

class CatDeleteInput {
  String id;
  CatDeleteInput(this.id);
}
