class AddVideoModel {
  bool? result;
  String? message;
  Data? data;
  String? error;

  AddVideoModel({this.result, this.message, this.data, this.error});

  AddVideoModel.fromJson(Map<String, dynamic> json) {
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
  String? courseId;
  String? authorId;
  String? video;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data({
    this.courseId,
    this.authorId,
    this.video,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    authorId = json['author_id'];
    video = json['video'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    data['author_id'] = this.authorId;
    data['video'] = this.video;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
