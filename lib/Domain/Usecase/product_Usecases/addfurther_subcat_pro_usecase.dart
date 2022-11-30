import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

import '../../../Data/network/failure.dart';
import '../../Model/model.dart';

class AddFurtherSubCatProductUsecase
    implements BaseUseCase<AddFurtherSubCatProductInput, AddProduct> {
  repositry _repositry;
  AddFurtherSubCatProductUsecase(this._repositry);

  @override
  Future<Either<Failure, AddProduct>> execute(
      AddFurtherSubCatProductInput input) {
    return _repositry.addFurtherSubCatProductRepositry(
        AddFurtherSubCatProductRequest(
            input.catId,
            input.subCatId,
            input.furtherSubCatId,
            input.name,
            input.des,
            input.url,
            input.color,
            input.size,
            input.limit,
            input.price));
  }
}

class AddFurtherSubCatProductInput {
  String catId;
  String subCatId;
  String furtherSubCatId;
  String name;
  String des;
  String url;
  String color;
  String size;
  String limit;
  String price;
  AddFurtherSubCatProductInput(
      this.catId,
      this.subCatId,
      this.furtherSubCatId,
      this.name,
      this.des,
      this.url,
      this.color,
      this.size,
      this.limit,
      this.price);
}
