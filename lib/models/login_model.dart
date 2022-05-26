class LoginResponse {
  LoginResponse({this.success, this.message, this.data});

  bool? success;
  String? message;
  Data? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}
class Data {
  Data(
      {this.token,
        });

  String? token;


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],

  );
}