class LoginModel {
  bool? result;
  String? message;
  String? token;
  Data? data;
  String? error;

  LoginModel({this.result, this.message, this.token, this.data, this.error});

  LoginModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  int? idUser;
  String? email;
  String? name;
  String? role;

  Data({this.idUser, this.email, this.name, this.role});

  Data.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    email = json['email'];
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    data['email'] = this.email;
    data['name'] = this.name;
    data['role'] = this.role;
    return data;
  }
}
