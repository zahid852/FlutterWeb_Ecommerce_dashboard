import 'package:dartz/dartz.dart';
import 'package:ecomerce_web/Data/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
