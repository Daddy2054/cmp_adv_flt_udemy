// ignore_for_file: public_member_api_docs, sort_constructors_first
import '/data/network/error_handler.dart';

class Failure {
  int code; //200 or 400
  String message; // error or success
  Failure(
    this.code,
    this.message,
  );
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
}
