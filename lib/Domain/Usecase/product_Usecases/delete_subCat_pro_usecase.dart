import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

import '../../../Data/network/failure.dart';
import '../../Model/model.dart';
import '../../Repositry/repositry.dart';

class DeleteSubCatProductUsecase
    implements BaseUseCase<DeleteSubCatProductInput, void> {
  repositry _repositry;
  DeleteSubCatProductUsecase(this._repositry);

  @override
  Future<Either<Failure, void>> execute(DeleteSubCatProductInput input) {
    return _repositry.deleteSubCatProductRepositry(DeleteSubCatProductRequest(
      input.catId,
      input.subCatId,
      input.subCatProId,
    ));
  }
}

class DeleteSubCatProductInput {
  String catId;
  String subCatId;
  String subCatProId;

  DeleteSubCatProductInput(
    this.catId,
    this.subCatId,
    this.subCatProId,
  );
}
