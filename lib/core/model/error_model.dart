class ErrorModel {
  String? type;
  int? code;
  String? message;

  ErrorModel({
    this.type,
    this.code,
    this.message,
  });

  ErrorModel.fromJson(Map<String, dynamic> map) {
    type = map['errorType'] as String;
    code = map['statusCode'] as int;
    message = map['message'] as String;
  }

  @override
  String toString() {
    return 'ErrorModel{type: $type, code: $code, message: $message}';
  }
}
