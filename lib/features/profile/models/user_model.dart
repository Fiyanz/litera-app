class UserModel {
  final String name;
  final String username;
  final String profileImageUrl;
  final String? gender;
  final String? birthDate;
  final String? email;

  UserModel({
    required this.name,
    required this.username,
    required this.profileImageUrl,
    this.gender,
    this.birthDate,
    this.email,
  });

  // copyWith berguna untuk membuat objek baru dengan data yang diperbarui
  // tanpa mengubah objek aslinya (prinsip immutability).
  UserModel copyWith({
    String? name,
    String? username,
    String? profileImageUrl,
    String? gender,
    String? birthDate,
    String? email,
  }) {
    return UserModel(
      name: name ?? this.name,
      username: username ?? this.username,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
    );
  }
}