class JoinedCourseModel {
  bool? result;
  String? message;
  Data? data;
  Null? error;

  JoinedCourseModel({this.result, this.message, this.data, this.error});

  JoinedCourseModel.fromJson(Map<String, dynamic> json) {
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
  List<Course>? course;
  List<Lecturer>? lecturer;

  Data({this.course, this.lecturer});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['course'] != null) {
      course = <Course>[];
      json['course'].forEach((v) {
        course!.add(new Course.fromJson(v));
      });
    }
    if (json['lecturer'] != null) {
      lecturer = <Lecturer>[];
      json['lecturer'].forEach((v) {
        lecturer!.add(new Lecturer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.course != null) {
      data['course'] = this.course!.map((v) => v.toJson()).toList();
    }
    if (this.lecturer != null) {
      data['lecturer'] = this.lecturer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Course {
  int? id;
  int? authorId;
  int? categoryId;
  Null? memberId;
  String? title;
  String? description;
  String? image;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Course({this.id, this.authorId, this.categoryId, this.memberId, this.title, this.description, this.image, this.deletedAt, this.createdAt, this.updatedAt});

  Course.fromJson(Map<String, dynamic> json) {
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

class Lecturer {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? role;

  Lecturer({this.id, this.name, this.email, this.emailVerifiedAt, this.createdAt, this.updatedAt, this.role});

  Lecturer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['role'] = this.role;
    return data;
  }
}
