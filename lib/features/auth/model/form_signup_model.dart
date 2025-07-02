class FormSignupModel {
  String id;
  String nik;
  String nama;
  String birtdayDate;
  String gender;
  String address;
  String imageKtp;

  FormSignupModel({
    required this.id,
    required this.nik,
    required this.nama,
    required this.birtdayDate,
    required this.gender,
    required this.address,
    required this.imageKtp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nik': nik,
      'nama': nama,
      'birtdayDate': birtdayDate,
      'gender': gender,
      'address': address,
      'imageKtp': imageKtp,
    };
  }

  factory FormSignupModel.fromJson(Map<String, dynamic> json) {
    return FormSignupModel(
      id: json['id'] as String,
      nik: json['nik'] as String,
      nama: json['nama'] as String,
      birtdayDate: json['birtdayDate'] as String,
      gender: json['gender'] as String,
      address: json['address'] as String,
      imageKtp: json['imageKtp'] as String,
    );
  }
}