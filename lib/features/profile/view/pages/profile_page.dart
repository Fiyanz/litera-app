import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/profile/viewmodel/profile_viewmodel.dart';
import 'package:litera_app/features/profile/view/widgets/menu_section.dart';
import 'package:litera_app/features/profile/view/widgets/profile_header.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menyediakan ViewModel untuk widget di bawahnya
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: Scaffold(
        backgroundColor: Pallete.primaryLightColor,
        // AppBar dibuat transparan agar menyatu dengan header custom
        appBar: AppBar(
          title: const Text('Profil', style: TextStyle(color: Pallete.primaryLightColor, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Pallete.backgroundColor,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Pallete.primaryLightColor, size: 30),
              onPressed: () {},
            ),
          ],
        ),
        body: Consumer<ProfileViewModel>(
          builder: (context, viewModel, child) {
            // Tampilkan loading jika data user belum ada
            if (viewModel.user == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  // 1. Widget Header Profil
                  ProfileHeader(user: viewModel.user!),
                  
                  // 2. Widget Menu
                  MenuSection(
                    onLogout: () {
                      viewModel.logout(context); // Panggil fungsi logout dari ViewModel
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}