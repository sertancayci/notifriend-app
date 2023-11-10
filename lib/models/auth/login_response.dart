class LoginResponse {
  String? token;
  String? email;
  String? username;

  // String? refreshToken;

  LoginResponse(this.token, this.email, this.username);

  factory LoginResponse.fromJson(Map<dynamic, dynamic> json) {
    return LoginResponse(
        json["token"].toString(), json["email"].toString(), json["username"].toString());
  }
}
