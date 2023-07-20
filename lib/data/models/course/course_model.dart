class CourseModel {
  bool? _result;
  String? _message;
  List<Data>? _data;
  String? _error;

  CourseModel({bool? result, String? message, List<Data>? data, String? error}) {
    if (result != null) {
      _result = result;
    }
    if (message != null) {
      _message = message;
    }
    if (data != null) {
      _data = data;
    }
    if (error != null) {
      _error = error;
    }
  }

  bool? get result => _result;
  set result(bool? result) => _result = result;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;
  String? get error => _error;
  set error(String? error) => _error = error;

  CourseModel.fromJson(Map<String, dynamic> json) {
    _result = json['result'] as bool;
    _message = json['message'] as String;
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
    _error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = _result;
    data['message'] = _message;
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    data['error'] = _error;
    return data;
  }
}

class Data {
  int? _id;
  int? _authorId;
  int? _categoryId;
  String? _memberId;
  String? _title;
  String? _description;
  String? _image;
  String? _deletedAt;
  String? _createdAt;
  String? _updatedAt;

  Data({int? id, int? authorId, int? categoryId, String? memberId, String? title, String? description, String? image, String? deletedAt, String? createdAt, String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (authorId != null) {
      _authorId = authorId;
    }
    if (categoryId != null) {
      _categoryId = categoryId;
    }
    if (memberId != null) {
      _memberId = memberId;
    }
    if (title != null) {
      _title = title;
    }
    if (description != null) {
      _description = description;
    }
    if (image != null) {
      _image = image;
    }
    if (deletedAt != null) {
      _deletedAt = deletedAt;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get authorId => _authorId;
  set authorId(int? authorId) => _authorId = authorId;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  String? get memberId => _memberId;
  set memberId(String? memberId) => _memberId = memberId;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get deletedAt => _deletedAt;
  set deletedAt(String? deletedAt) => _deletedAt = deletedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _authorId = json['author_id'];
    _categoryId = json['category_id'];
    _memberId = json['member_id'];
    _title = json['title'];
    _description = json['description'];
    _image = json['image'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['author_id'] = _authorId;
    data['category_id'] = _categoryId;
    data['member_id'] = _memberId;
    data['title'] = _title;
    data['description'] = _description;
    data['image'] = _image;
    data['deleted_at'] = _deletedAt;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
