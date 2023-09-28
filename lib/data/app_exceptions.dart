class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, "No Internet");
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, "Request Time Out");
}

class SeverException extends AppException {
  SeverException([String? message]) : super(message, "Interal Sever error");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Bad request error");
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, "");
}
