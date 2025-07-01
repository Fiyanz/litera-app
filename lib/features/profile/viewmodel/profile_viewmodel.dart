import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileViewModel extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  ProfileViewModel() {
    loadUserData();
  }

  // Mengambil data pengguna (bisa dari API di masa depan)
  void loadUserData() {
    _user = UserModel(
      name: 'Kanyest Lalula',
      username: '@kanye',
      birthDate: DateTime(1990, 1, 1),
      gender: 'Pria',
      profileImageUrl: 'https://i.pravatar.cc/150?img=68',
    );
    notifyListeners(); // Memberi tahu UI untuk update
  }

  // Logika untuk logout
  void logout(BuildContext context) {
    // Di sini Anda bisa menambahkan logika hapus token, dll.
    print('Proses logout...');
    // Contoh: Tampilkan snackbar setelah logout
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Anda telah logout.')),
    );
    // Navigasi ke halaman login (jika ada)
  }
}