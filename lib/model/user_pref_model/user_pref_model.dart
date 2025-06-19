class UserPrefModel {
  final String? token;
  final bool? isLogin;

  UserPrefModel({this.token, this.isLogin});

  // To convert JSON (Map) to SharedPrefModel model
  factory UserPrefModel.fromJson(Map<String, dynamic> json) {
    return UserPrefModel(
      token: json['token'] as String?,
      isLogin: json['isLogin'] as bool?,
    );
  }

  // To convert SharedPrefModel model to JSON (Map)
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'isLogin': isLogin,
    };
  }
}