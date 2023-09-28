import 'package:getx_mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.completed(this.data) : status = Status.complete;
  ApiResponse.error(this.message) : status = Status.error;

  @override
  toString() {
    return "Status: $status\n Data: $data\n Message: $message";
  }
}
