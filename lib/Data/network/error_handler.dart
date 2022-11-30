import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomerce_web/Data/network/failure.dart';
import 'package:ecomerce_web/Presentation/resources/string_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum DataSource {
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CANCEL,
  CONNECTION_TIMEOUT,
  SEND_TIMEOUT,
  RECEIVE_TIMEOUT,
  NO_INTERNET_CONNECION,
  CACHE_ERROR,
  CAT_NAME_ALREADY_EXISTS,
  PRO_NAME_ALREADY_EXISTS,
  PARAMETER_ERROR,
  //FIREBASE EXCEPTIONS
  INVALID_CREDENTIAL,
  NETWORK_ERROR,
  USER_DISABLED,
  INAVLID_VERIFICATION_ID,
  INVALID_VARIFICATION_CODE,
  TOO_MANY_REQUESTS,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(responseCodes.BAD_REQUEST, responseMessages.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(responseCodes.FORBIDDEN, responseMessages.FORBIDDEN);
      case DataSource.UNAUTHORIZED:
        return Failure(
            responseCodes.UNAUTHORIZED, responseMessages.UNAUTHORIZED);
      case DataSource.NOT_FOUND:
        return Failure(responseCodes.NOT_FOUND, responseMessages.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(responseCodes.INTERNAL_SERVER_ERROR,
            responseMessages.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECTION_TIMEOUT:
        return Failure(responseCodes.CONNECTION_TIMEOUT,
            responseMessages.CONNECTION_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(responseCodes.CANCEL, responseMessages.CANCEL);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            responseCodes.RECEIVE_TIMEOUT, responseMessages.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(
            responseCodes.SEND_TIMEOUT, responseMessages.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(responseCodes.CACHE_ERROR, responseMessages.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECION:
        return Failure(responseCodes.NO_INTERNET_CONNECION,
            responseMessages.NO_INTERNET_CONNECION);
      case DataSource.CAT_NAME_ALREADY_EXISTS:
        return Failure(
            responseCodes.CAT_DATA_EXISTS, responseMessages.CAT_DATA_EXISTS);
      case DataSource.PRO_NAME_ALREADY_EXISTS:
        return Failure(
            responseCodes.PRO_DATA_EXISTS, responseMessages.PRO_DATA_EXISTS);
      case DataSource.PARAMETER_ERROR:
        return Failure(responseCodes.PARA_ERROR, responseMessages.PARA_ERROR);

      //Firebase error case
      case DataSource.INVALID_CREDENTIAL:
        return Failure(responseCodes.INVALID_CREDENTIAL,
            responseMessages.INVALID_CREDENTAIL);
      case DataSource.NETWORK_ERROR:
        return Failure(
            responseCodes.NETWORK_ERROR, responseMessages.NETWORK_ERROR);
      case DataSource.USER_DISABLED:
        return Failure(
            responseCodes.DISABLED_USER, responseMessages.DISABLED_USER);
      case DataSource.INVALID_VARIFICATION_CODE:
        return Failure(responseCodes.INVALID_VERIFICATION_CODE,
            responseMessages.INVALID_VERIFICATION_CODE);
      case DataSource.INAVLID_VERIFICATION_ID:
        return Failure(responseCodes.INVALID_VERIFICATION_ID,
            responseMessages.INVALID_VERIFICATION_ID);
      case DataSource.TOO_MANY_REQUESTS:
        return Failure(responseCodes.TOO_MANY_REQUESTS,
            responseMessages.TOO_MANY_REQUESTS_MESSAGE);
      default:
        return Failure(responseCodes.DEFAULT, responseMessages.DEFAULT);
    }
  }
}

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler(dynamic error) {
    if (error is FirebaseAuthException) {
      failure = handleFirebaseError(error);
    } else if (error is DioError) {
//dio error so it the error from the response of the Api

      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.CONNECTION_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioErrorType
          .response: // when a server response, but with a incorrect status
        switch (error.response?.statusCode) {
          case responseCodes.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();
          case responseCodes.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();
          case responseCodes.UNAUTHORIZED:
            return DataSource.UNAUTHORIZED.getFailure();
          case responseCodes.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();
          case responseCodes.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR.getFailure();
          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }

  Failure handleFirebaseError(FirebaseAuthException error) {
    switch (error.code) {
      case AppStrings.invalid_verification_id:
        return DataSource.INAVLID_VERIFICATION_ID.getFailure();
      case AppStrings.network_error:
        return DataSource.NETWORK_ERROR.getFailure();
      case AppStrings.invalid_verification_code:
        return DataSource.INVALID_VARIFICATION_CODE.getFailure();
      case AppStrings.disabled_user:
        return DataSource.USER_DISABLED.getFailure();
      case AppStrings.invalid_credential:
        return DataSource.INVALID_CREDENTIAL.getFailure();
      case AppStrings.too_many_requests:
        return DataSource.TOO_MANY_REQUESTS.getFailure();
      default:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

class responseCodes {
//api status codes
  static const int SUCCESS = 200; //success with data
  static const int NO_CONTENT = 201; //success with no content
  static const int BAD_REQUEST = 400; //failure,api rejected the request
  static const int FORBIDDEN = 403; //failure,api rejected the request
  static const int UNAUTHORIZED = 401; //  failure,user is not authorized
  static const int NOT_FOUND =
      404; //failure, api url is not correct and not found
  static const int INTERNAL_SERVER_ERROR =
      501; //failure, crash happened in server side

  //firebase auth exeption codes
  static const String INVALID_CREDENTIAL = AppStrings.invalid_credential;
  static const String NETWORK_ERROR = AppStrings.network_error;
  static const String INVALID_VERIFICATION_ID =
      AppStrings.invalid_verification_id;
  static const String INVALID_VERIFICATION_CODE =
      AppStrings.invalid_verification_code;
  static const String DISABLED_USER = AppStrings.disabled_user;
  static const String TOO_MANY_REQUESTS = AppStrings.too_many_requests;

//local status codes
  static const int DEFAULT = -1;
  static const int CONNECTION_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECION = -7;
  static const int CAT_DATA_EXISTS = -8;
  static const int PRO_DATA_EXISTS = -9;
  static const int PARA_ERROR = -10;
}

class responseMessages {
  static const String NO_CONTENT =
      AppStrings.no_content; //success with no content
  static const String BAD_REQUEST =
      AppStrings.bad_request; //failure,api rejected the request
  static const String FORBIDDEN =
      AppStrings.forbidden; //failure,api rejected the request
  static const String UNAUTHORIZED =
      AppStrings.unauthorized; //  failure,user is not authorized
  static const String NOT_FOUND =
      AppStrings.not_found; //failure, api url is not correct and not found
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.internal_server_error; //failure, crash happened in server side

  //local status codes
  static const String CONNECTION_TIMEOUT = AppStrings.connection_timeOut;
  static const String CANCEL = AppStrings.cancel;
  static const String RECEIVE_TIMEOUT = AppStrings.receive_timeout;
  static const String SEND_TIMEOUT = AppStrings.send_timeout;
  static const String CACHE_ERROR = AppStrings.cache_error;
  static const String NO_INTERNET_CONNECION = AppStrings.no_internet_connection;
  static const String CAT_DATA_EXISTS = AppStrings.cat_data_exists;
  static const String PRO_DATA_EXISTS = AppStrings.pro_data_exists;
  static const String PARA_ERROR = AppStrings.parameter_error;

  //firebase messages
  static const String INVALID_CREDENTAIL =
      AppStrings.invalid_credential_message;
  static const String NETWORK_ERROR = AppStrings.network_error_message;
  static const String INVALID_VERIFICATION_ID =
      AppStrings.invalid_verification_id_message;
  static const String INVALID_VERIFICATION_CODE =
      AppStrings.invalid_verification_code_message;
  static const String DISABLED_USER = AppStrings.disable_user_message;
  static const String TOO_MANY_REQUESTS_MESSAGE =
      AppStrings.too_many_requests_message;

  static const String DEFAULT = AppStrings.default_exception_message;
}
