class LoginRequest {
  LoginRequest({required this.email,
    required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['telephone'] = email;
    data['password'] = password;
    return data;
  }
}