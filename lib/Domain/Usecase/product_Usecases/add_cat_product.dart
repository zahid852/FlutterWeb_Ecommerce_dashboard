import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/Request/request.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Domain/Model/model.dart';
import 'package:ecomerce_web/Domain/Repositry/repositry.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

class AddCatProductUsecase
    implements BaseUseCase<AddCatProductInput, AddProduct> {
  repositry _repositry;
  AddCatProductUsecase(this._repositry);

  @override
  Future<Either<Failure, AddProduct>> execute(AddCatProductInput input) {
    return _repositry.addCatProductRepositry(AddCatProductRequest(
        input.catId,
        input.name,
        input.des,
        input.url,
        input.color,
        input.size,
        input.limit,
        input.price));
  }
}

class AddCatProductInput {
  String catId;
  String name;
  String des;
  String url;
  String color;
  String size;
  String limit;
  String price;
  AddCatProductInput(this.catId, this.name, this.des, this.url, this.color,
      this.size, this.limit, this.price);
}
