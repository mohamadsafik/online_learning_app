class CourseModel {
  bool? result;
  String? message;
  List<Data>? data;
  String? error;

  CourseModel({this.result, this.message, this.data, this.error});

  CourseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      if (json['data'] is List) {
        for (var v in json['data']) {
          data!.add(Data.fromJson(v));
        }
      } else if (json['data'] is Map<String, dynamic>) {
        data!.add(Data.fromJson(json['data']));
      }
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = result;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['error'] = error;
    return data;
  }
}

class Data {
  int? id;
  String? authorId;
  String? categoryId;
  String? memberId;
  String? title;
  String? description;
  String? image;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.authorId,
    this.categoryId,
    this.memberId,
    this.title,
    this.description,
    this.image,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorId = json['author_id'].toString();
    categoryId = json['category_id'].toString();
    memberId = json['member_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['author_id'] = authorId;
    data['category_id'] = categoryId;
    data['member_id'] = memberId;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
