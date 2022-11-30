import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';
import '../../Repositry/repositry.dart';

class AddSubCatUsecase implements BaseUseCase<SubCatAddInput, AddSubCategory> {
  repositry _repositry;
  AddSubCatUsecase(this._repositry);

  @override
  Future<Either<Failure, AddSubCategory>> execute(SubCatAddInput input) {
    return _repositry.addSubCatRepositry(SubCatAddRequest(
        input.catId, input.name, input.des, input.url, input.parameter));
  }
}

class SubCatAddInput {
  String catId;

  String name;
  String des;
  String url;
  int parameter;
  SubCatAddInput(this.catId, this.name, this.des, this.url, this.parameter);
}
