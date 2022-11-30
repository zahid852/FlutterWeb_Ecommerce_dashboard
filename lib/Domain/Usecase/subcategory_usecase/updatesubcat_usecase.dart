import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

class UpdateSubCatUsecase
    implements BaseUseCase<SubCatUpdateInput, CategoryWithoutId> {
  repositry _repositry;
  UpdateSubCatUsecase(this._repositry);

  @override
  Future<Either<Failure, CategoryWithoutId>> execute(SubCatUpdateInput input) {
    return _repositry.updateSubCatRepositry(SubCatUpdateRequest(input.catId,
        input.subcatId, input.name, input.des, input.url, input.parameter));
  }
}

class SubCatUpdateInput {
  String catId;
  String subcatId;
  String name;
  String des;
  String url;
  int parameter;
  SubCatUpdateInput(
      this.catId, this.subcatId, this.name, this.des, this.url, this.parameter);
}
