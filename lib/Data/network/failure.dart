import 'package:ecomerce_web/Data/network/error_handler.dart';

class Failure {
  var code;
  String message;
  Failure(this.code, this.message);
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(responseCodes.DEFAULT, responseMessages.DEFAULT);
}
