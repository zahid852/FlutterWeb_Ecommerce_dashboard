import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Data/responses/response.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

class AddCatUsecase implements BaseUseCase<CatAddInput, AddCategory> {
  repositry _repositry;
  AddCatUsecase(this._repositry);

  @override
  Future<Either<Failure, AddCategory>> execute(CatAddInput input) {
    return _repositry.addCatRepositry(
        CatAddRequest(input.name, input.des, input.url, input.parameter));
  }
}

class CatAddInput {
  String name;
  String des;
  String url;
  int parameter;
  CatAddInput(this.name, this.des, this.url, this.parameter);
}
