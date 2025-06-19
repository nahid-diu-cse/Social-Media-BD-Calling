class NearbyUserDataModel {
  bool? success;
  String? message;
  List<Data>? data;

  NearbyUserDataModel({this.success, this.message, this.data});

  NearbyUserDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? email;
  String? phoneNumber;
  String? fullname;
  int? distance;
  String? id;
  String? profilePicture;

  Data(
      {this.email,
        this.phoneNumber,
        this.fullname,
        this.distance,
        this.id,
        this.profilePicture});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    fullname = json['fullname'];
    distance = json['distance'];
    id = json['id'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['fullname'] = this.fullname;
    data['distance'] = this.distance;
    data['id'] = this.id;
    data['profilePicture'] = this.profilePicture;
    return data;
  }
}
