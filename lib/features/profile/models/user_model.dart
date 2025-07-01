class UserModel {
  String name, username, gender, profileImageUrl;
  DateTime birthDate;
  UserModel({
    required this.name,
    required this.username,
    required this.birthDate,
    required this.gender,
    required this.profileImageUrl,
  });
}