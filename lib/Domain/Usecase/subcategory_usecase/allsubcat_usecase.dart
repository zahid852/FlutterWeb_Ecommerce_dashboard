import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

class AllSubCatUsecase implements BaseUseCase<CatIdInput, List<SubCategory>> {
  repositry _repositry;
  AllSubCatUsecase(this._repositry);

  @override
  Future<Either<Failure, List<SubCategory>>> execute(CatIdInput input) {
    return _repositry.allSubCatRepositry(CatIdRequest(input.id));
  }
}

class CatIdInput {
  String id;
  CatIdInput(this.id);
}
