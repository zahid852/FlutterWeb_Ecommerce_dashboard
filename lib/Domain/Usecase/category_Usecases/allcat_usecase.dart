import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Domain/Usecase/base_usecase.dart';

import '../../../Data/network/failure.dart';
import '../../Model/model.dart';
import '../../Repositry/repositry.dart';

class AllCatUsecase implements BaseUseCase<String, List<Category>> {
  repositry _repositry;
  AllCatUsecase(this._repositry);

  @override
  Future<Either<Failure, List<Category>>> execute(String empty) {
    return _repositry.allCatRepositry();
  }
}
