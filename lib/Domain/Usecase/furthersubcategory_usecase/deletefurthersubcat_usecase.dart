import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

import '../../Repositry/repositry.dart';

class DeleteFurtherSubCatUsecase
    implements BaseUseCase<FurtherSubCatDeleteInput, void> {
  repositry _repositry;
  DeleteFurtherSubCatUsecase(this._repositry);

  @override
  Future<Either<Failure, void>> execute(FurtherSubCatDeleteInput input) {
    return _repositry.deleteFurtherSubCatRepositry(FurtherSubCatDeleteRequest(
        input.CatId, input.SubCatId, input.FurtherSubCatId));
  }

  @override
  Future<Either<Failure, void>> executeFurtherSubCatPro(
      FurtherSubCatDeleteInput input) {
    return _repositry.deleteFurtherSubCatProRepositry(
        FurtherSubCatDeleteRequest(
            input.CatId, input.SubCatId, input.FurtherSubCatId));
  }
}

class FurtherSubCatDeleteInput {
  String CatId;
  String SubCatId;
  String FurtherSubCatId;
  FurtherSubCatDeleteInput(this.CatId, this.SubCatId, this.FurtherSubCatId);
}
