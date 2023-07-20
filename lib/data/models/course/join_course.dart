class JoinCourseModel {
  bool? result;
  String? message;
  Data? data;
  String? error;

  JoinCourseModel({this.result, this.message, this.data, this.error});

  JoinCourseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
  String? courseId;
  String? userId;
  String? joinedAt;
  String? completedAt;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data({this.courseId, this.userId, this.joinedAt, this.completedAt, this.updatedAt, this.createdAt, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    userId = json['user_id'];
    joinedAt = json['joined_at'];
    completedAt = json['completed_at'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    data['user_id'] = this.userId;
    data['joined_at'] = this.joinedAt;
    data['completed_at'] = this.completedAt;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
