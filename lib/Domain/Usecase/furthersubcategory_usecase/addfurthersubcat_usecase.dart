import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

class AddFurtherSubCatUsecase
    implements BaseUseCase<FurtherSubCatAddInput, AddSubCategory> {
  repositry _repositry;
  AddFurtherSubCatUsecase(this._repositry);

  @override
  Future<Either<Failure, AddSubCategory>> execute(FurtherSubCatAddInput input) {
    return _repositry.addFurtherSubCatRepositry(FurtherSubCatAddRequest(
        input.catId,
        input.SubCatId,
        input.name,
        input.des,
        input.url,
        input.parameter));
  }
}

class FurtherSubCatAddInput {
  String catId;
  String SubCatId;
  String name;
  String des;
  String url;
  int parameter;
  FurtherSubCatAddInput(
      this.catId, this.SubCatId, this.name, this.des, this.url, this.parameter);
}
