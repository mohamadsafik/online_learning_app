class DeleteModel {
  bool? result;
  String? message;
  String? error;

  DeleteModel({this.result, this.message, this.error});

  DeleteModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['message'] = this.message;
    data['error'] = this.error;
    return data;
  }
}
