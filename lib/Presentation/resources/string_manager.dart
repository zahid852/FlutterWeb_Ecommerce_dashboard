class AppStrings {
  static const noRecordFound = 'No record found';
  static const sendCode = 'Send Code Via SMS';
  static const hintPhoneNumber = '301 3267831';
  static const EnterMobileNumberTitle = 'Enter your mobile number';
  static const EnterMobileNumberSubtitle =
      'Enter your mobile number, to create an account or log in';
  static const DefaultCountryCode = '+92';
  static const dataAdded = 'Data added successfully.';
  static const dataUpdated = 'Data updated successfully.';

//Firebase Exceptions codes
  static const invalid_credential = 'invalid-credential';
  static const String network_error = 'network-request-failed';
  static const invalid_verification_id = 'invalid-verification-id';
  static const invalid_verification_code = 'invalid-verification-code';
  static const disabled_user = 'user-disabled';
  static const too_many_requests = 'too-many-requests';

//Firebase Exception messages
  static const invalid_credential_message =
      'The credential is malformed or has expired.';
  static const String network_error_message = 'Please connect to the internet.';
  static const invalid_verification_id_message =
      'Verification ID of the credential is not a valid ID.';
  static const invalid_verification_code_message =
      'The sms code of the credential is not valid.';
  static const disable_user_message =
      'The user corresponding to the given credential has been disabled.';
  static const default_exception_message = 'Please try again later.';
  static const too_many_requests_message =
      'You have made too many requests. Please try again later.';

  static const ok = 'Ok';
  static const String verifyMobileNumberTitle = 'Verify your mobile number';
  static const String VerifyMobileNumberSubtitle =
      'You will receive a SMS with verification pin on';

  static const String Loading = 'Please wait...';

  //error handler
  static const String no_content = "Success with no content";
  static const String bad_request = "Bad request. Try again later.";
  static const String forbidden = "Forbidden Request. Try again later";
  static const String unauthorized =
      "Permission denied. You are trying to add duplicate data.";
  static const String not_found = "Url not found. Try again later";
  static const String internal_server_error =
      "There is internal server error. Try again later.";
  static const String connection_timeOut = "Timeout, Try again later.";
  static const String cancel = "Request cancelled. Try again later.";
  static const String receive_timeout = "Timeout, Try again later.";
  static const String send_timeout = "Timeout, Try again later.";
  static const String cache_error = "Cache error, Try again later.";
  static const String no_internet_connection =
      "No internet connection, Try again later.";
  static const String cat_data_exists = "This category already exists.";
  static const String pro_data_exists = "This product already exists.";
  static const String parameter_error =
      "This category has products based on selling parameter. To update parameter of category, delete this category products.";

  static const String dataNotAdded = "Data not addded. Try again.";
  static const String dataNotUpdated = "Data not updated. Try again.";
  static const String dataNotDeleted = "Data not deleted. Try again.";
  static const String dataDeleted = "Data deleted successfully.";
}
