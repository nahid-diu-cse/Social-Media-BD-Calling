class LogInResponseModel {
  bool? success;
  String? message;
  Data? data;

  LogInResponseModel({this.success, this.message, this.data});

  LogInResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? refreshToken;
  int? loginCount;
  String? role;
  String? id;
  String? profilePicture;

  Data(
      {this.accessToken,
        this.refreshToken,
        this.loginCount,
        this.role,
        this.id,
        this.profilePicture});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    loginCount = json['loginCount'];
    role = json['role'];
    id = json['id'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['loginCount'] = loginCount;
    data['role'] = role;
    data['id'] = id;
    data['profilePicture'] = profilePicture;
    return data;
  }
}
