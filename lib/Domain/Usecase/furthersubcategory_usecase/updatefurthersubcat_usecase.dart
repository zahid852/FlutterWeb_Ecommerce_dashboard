import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

class UpdateFurtherSubCatUsecase
    implements BaseUseCase<FurtherSubCatUpdateInput, CategoryWithoutId> {
  repositry _repositry;
  UpdateFurtherSubCatUsecase(this._repositry);

  @override
  Future<Either<Failure, CategoryWithoutId>> execute(
      FurtherSubCatUpdateInput input) {
    return _repositry.updateFurtherSubCatRepositry(FurtherSubCatUpdateRequest(
        input.catId,
        input.subcatId,
        input.furtherSubCatId,
        input.name,
        input.des,
        input.url,
        input.parameter));
  }
}

class FurtherSubCatUpdateInput {
  String catId;
  String subcatId;
  String furtherSubCatId;
  String name;
  String des;
  String url;
  int parameter;
  FurtherSubCatUpdateInput(this.catId, this.subcatId, this.furtherSubCatId,
      this.name, this.des, this.url, this.parameter);
}
