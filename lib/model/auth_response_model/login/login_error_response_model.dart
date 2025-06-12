class LogInErrorResponseModel {
  bool? success;
  String? message;
  Null? errorDetails;
  Error? error;

  LogInErrorResponseModel(
      {this.success, this.message, this.errorDetails, this.error});

  LogInErrorResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    errorDetails = json['errorDetails'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['errorDetails'] = this.errorDetails;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Error {
  int? statuscode;
  String? message;

  Error({this.statuscode, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuscode'] = this.statuscode;
    data['message'] = this.message;
    return data;
  }
}
