class SearchCourseModel {
  bool? result;
  String? message;
  List<Data>? data;
  String? error;

  SearchCourseModel({this.result, this.message, this.data, this.error});

  SearchCourseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  int? id;
  int? authorId;
  int? categoryId;
  String? memberId;
  String? title;
  String? description;
  String? image;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.authorId, this.categoryId, this.memberId, this.title, this.description, this.image, this.deletedAt, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorId = json['author_id'];
    categoryId = json['category_id'];
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
    data['id'] = this.id;
    data['author_id'] = this.authorId;
    data['category_id'] = this.categoryId;
    data['member_id'] = this.memberId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
