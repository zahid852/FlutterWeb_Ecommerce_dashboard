import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';

import '../../../Data/network/failure.dart';
import '../base_usecase.dart';

class DeleteFurtherSubCatProductUsecase
    implements BaseUseCase<DeleteFurtherSubCatProductInput, void> {
  repositry _repositry;
  DeleteFurtherSubCatProductUsecase(this._repositry);

  @override
  Future<Either<Failure, void>> execute(DeleteFurtherSubCatProductInput input) {
    return _repositry.deleteFurtherSubCatProductRepositry(
        DeleteFurtherSubCatProductRequest(input.catId, input.subCatId,
            input.FurtherSubCatId, input.FurtherSubCatProId));
  }
}

class DeleteFurtherSubCatProductInput {
  String catId;
  String subCatId;
  String FurtherSubCatId;
  String FurtherSubCatProId;

  DeleteFurtherSubCatProductInput(
      this.catId, this.subCatId, this.FurtherSubCatId, this.FurtherSubCatProId);
}
