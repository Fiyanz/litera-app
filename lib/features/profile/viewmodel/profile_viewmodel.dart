import 'package:flutter/material.dart';
import 'package:litera_app/features/auth/view/pages/signin_page.dart';
import 'package:litera_app/features/profile/models/address_model.dart';
import '../models/user_model.dart';

class ProfileViewModel extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  // Controller untuk setiap field yang bisa diedit
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController emailController;

  // Controller untuk alamat
  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  late TextEditingController provinceController;
  late TextEditingController cityController;
  late TextEditingController districtController;
  late TextEditingController postalCodeController;
  late TextEditingController addressDetailsController;

  ProfileViewModel() {
    loadUserData();
  }

  void loadUserData() {
    _user = UserModel(
      name: 'Kanye Lalula',
      username: 'kanyest',
      profileImageUrl: 'https://i.pravatar.cc/150?img=68',
      gender: 'Perempuan',
      birthDate: '08 Januari 2005',
      email: 'Kanyetilldrop@gmail.com',
      address: AddressModel(
        fullName: 'Kanye Lalula',
        phoneNumber: '081234567890',
        province: 'Jawa Barat',
        city: 'Bandung',
        district: 'Coblong',
        postalCode: '40123',
        details: 'Jl. Merdeka No. 123, RT 01/RW 02',
      ),
    );

    // Inisialisasi controller dengan data dari user model
    nameController = TextEditingController(text: _user!.name);
    usernameController = TextEditingController(text: _user!.username);
    emailController = TextEditingController(text: _user!.email);

    // Inisialisasi controller alamat
    final address = _user!.address;
    fullNameController = TextEditingController(text: address?.fullName);
    phoneController = TextEditingController(text: address?.phoneNumber);
    provinceController = TextEditingController(text: address?.province);
    cityController = TextEditingController(text: address?.city);
    districtController = TextEditingController(text: address?.district);
    postalCodeController = TextEditingController(text: address?.postalCode);
    addressDetailsController = TextEditingController(text: address?.details);
  }

  // Fungsi untuk menyimpan perubahan profil
  void saveProfile(BuildContext context) {
    // Perbarui model _user dengan data dari controller
    _user = _user!.copyWith(
      name: nameController.text,
      username: usernameController.text,
      email: emailController.text,
    );

    // Beri tahu semua listener (seperti ProfilePage) bahwa data telah berubah
    notifyListeners();

    // Tampilkan notifikasi dan kembali ke halaman sebelumnya
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profil berhasil disimpan!'),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.of(context).pop();
  }

  void saveAddress(BuildContext context) {
      final newAddress = _user!.address!.copyWith(
        fullName: fullNameController.text,
        phoneNumber: phoneController.text,
        province: provinceController.text,
        city: cityController.text,
        district: districtController.text,
        postalCode: postalCodeController.text,
        details: addressDetailsController.text,
      );

      _user = _user!.copyWith(address: newAddress);
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Alamat berhasil disimpan!'), backgroundColor: Colors.green),
      );
      Navigator.of(context).pop();
    }

  // Penting untuk membersihkan controller saat ViewModel tidak lagi digunakan
  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();

    // Dispose controller alamat
    fullNameController.dispose();
    phoneController.dispose();
    provinceController.dispose();
    cityController.dispose();
    districtController.dispose();
    postalCodeController.dispose();
    addressDetailsController.dispose();
    super.dispose();
  }

  void logout(BuildContext context) {
    print('Proses logout dan pembersihan data sesi...');
    // Di sini Anda bisa menambahkan logika untuk menghapus data sesi,
    // token, atau cache pengguna.

    // Navigasi ke LoginPage dan hapus semua halaman sebelumnya dari stack.
    // (route) => false memastikan tidak ada rute lama yang tersisa.
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInPage()),
      (route) => false,
    );
  }
}