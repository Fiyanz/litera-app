
class SignUpModel {
  final String username;
  final String email;
  final String password;

  SignUpModel({
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': username,
      'email': email,
      'password': password,
    };
  }

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      username: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}
