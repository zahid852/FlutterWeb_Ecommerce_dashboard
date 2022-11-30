import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

import '../../Model/model.dart';

class UpdateCatUsecase
    implements BaseUseCase<CatUpdateInput, CategoryWithoutId> {
  repositry _repositry;
  UpdateCatUsecase(this._repositry);

  @override
  Future<Either<Failure, CategoryWithoutId>> execute(CatUpdateInput input) {
    return _repositry.updateCatRepositry(CatUpdateRequest(
        input.id, input.name, input.des, input.url, input.parameter));
  }
}

class CatUpdateInput {
  String id;
  String name;
  String des;
  String url;
  int parameter;
  CatUpdateInput(this.id, this.name, this.des, this.url, this.parameter);
}
