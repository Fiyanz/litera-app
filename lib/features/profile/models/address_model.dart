class AddressModel {
  final String fullName;
  final String phoneNumber;
  final String province;
  final String city;
  final String district;
  final String postalCode;
  final String details;

  AddressModel({
    required this.fullName,
    required this.phoneNumber,
    required this.province,
    required this.city,
    required this.district,
    required this.postalCode,
    required this.details,
  });

  // copyWith untuk memudahkan update data
  AddressModel copyWith({
    String? fullName,
    String? phoneNumber,
    String? province,
    String? city,
    String? district,
    String? postalCode,
    String? details,
  }) {
    return AddressModel(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      province: province ?? this.province,
      city: city ?? this.city,
      district: district ?? this.district,
      postalCode: postalCode ?? this.postalCode,
      details: details ?? this.details,
    );
  }
}