import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

class DeleteSubCatUsecase implements BaseUseCase<SubCatDeleteInput, void> {
  repositry _repositry;
  DeleteSubCatUsecase(this._repositry);

  @override
  Future<Either<Failure, void>> execute(SubCatDeleteInput input) {
    return _repositry.deleteSubCatRepositry(
        SubCatDeleteRequest(input.CatId, input.SubCatId));
  }

  @override
  Future<Either<Failure, void>> executeSubCatPro(SubCatDeleteInput input) {
    return _repositry.deleteSubCatProRepositry(
        SubCatDeleteRequest(input.CatId, input.SubCatId));
  }
}

class SubCatDeleteInput {
  String CatId;
  String SubCatId;
  SubCatDeleteInput(this.CatId, this.SubCatId);
}
