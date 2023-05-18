class CourseModel {
  bool? result;
  String? message;
  Data? data;
  String? error;

  CourseModel({this.result, this.message, this.data, this.error});

  CourseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  String? authorId;
  String? categoryId;
  String? memberId;
  String? transactionId;
  String? title;
  String? description;
  String? image;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.authorId,
      this.categoryId,
      this.memberId,
      this.transactionId,
      this.title,
      this.description,
      this.image,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    authorId = json['author_id'];
    categoryId = json['category_id'];
    memberId = json['member_id'];
    transactionId = json['transaction_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_id'] = this.authorId;
    data['category_id'] = this.categoryId;
    data['member_id'] = this.memberId;
    data['transaction_id'] = this.transactionId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
