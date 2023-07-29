class GetVideoByCourseIdAndAuthorIdModel {
  bool? result;
  String? message;
  List<Data>? data;
  String? error;

  GetVideoByCourseIdAndAuthorIdModel({this.result, this.message, this.data, this.error});

  GetVideoByCourseIdAndAuthorIdModel.fromJson(Map<String, dynamic> json) {
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
  int? courseId;
  int? authorId;
  String? video;
  String? createdAt;
  String? updatedAt;
  String? title;

  Data({this.id, this.courseId, this.authorId, this.video, this.createdAt, this.updatedAt, this.title});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    authorId = json['author_id'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_id'] = this.courseId;
    data['author_id'] = this.authorId;
    data['video'] = this.video;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['title'] = this.title;
    return data;
  }
}
