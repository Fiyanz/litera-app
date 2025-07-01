import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/profile/models/user_model.dart';
import 'package:litera_app/features/profile/view/pages/edit_profile_page.dart';
import 'package:litera_app/features/profile/viewmodel/profile_viewmodel.dart';
import 'package:provider/provider.dart'; // Pastikan provider di-import

class ProfileHeader extends StatelessWidget {
  final UserModel user;
  const ProfileHeader({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Container dan widget lainnya tetap sama
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      decoration: const BoxDecoration(
        color: Pallete.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            // ==== PERUBAHAN DIMULAI DI SINI ====
            onTap: () {
              // 1. Ambil instance ViewModel yang sudah ada dari context saat ini.
              //    listen: false karena kita tidak perlu me-rebuild widget ini saat panggil fungsi.
              final viewModel = Provider.of<ProfileViewModel>(context, listen: false);

              // 2. Gunakan Navigator.push seperti biasa.
              Navigator.push(
                context,
                MaterialPageRoute(
                  // 3. Bungkus EditProfilePage dengan ChangeNotifierProvider.value
                  builder: (_) => ChangeNotifierProvider.value(
                    // 4. Berikan instance viewModel ke halaman baru.
                    value: viewModel,
                    child: const EditProfilePage(),
                  ),
                ),
              );
            },
            // ==== PERUBAHAN SELESAI DI SINI ====
            customBorder: const CircleBorder(),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.profileImageUrl),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Pallete.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('Ubah', style: TextStyle(color: Pallete.primaryLightColor, fontSize: 12)),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(user.name, style: const TextStyle(color: Pallete.primaryLightColor, fontSize: 22, fontWeight: FontWeight.bold)),
          Text(user.username, style: const TextStyle(color: Pallete.primaryLightColor, fontSize: 16)),
        ],
      ),
    );
  }
}