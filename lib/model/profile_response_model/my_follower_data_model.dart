class MyFollowerDataModel {
  MyFollowerDataModel({
    this.success,
    this.message,
    this.meta,
    this.data,
  });
  bool? success;
  String? message;
  Meta? meta;
  List<dynamic>? data;

  MyFollowerDataModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    meta = Meta.fromJson(json['meta']);
    data = List.castFrom<dynamic, dynamic>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['meta'] = meta?.toJson();
    _data['data'] = data;
    return _data;
  }
}

class Meta {
  Meta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });
  late final int page;
  late final int limit;
  late final int total;
  late final int totalPage;

  Meta.fromJson(Map<String, dynamic> json){
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['limit'] = limit;
    _data['total'] = total;
    _data['totalPage'] = totalPage;
    return _data;
  }
}