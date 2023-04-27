class Response {
  final bool result;
  final String code;
  final String message;
  final Map<String, dynamic> data;

  Response({
    required this.result,
    required this.code,
    required this.message,
    required this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      result: json['result'],
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }
}
