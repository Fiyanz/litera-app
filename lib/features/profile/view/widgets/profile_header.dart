import 'package:flutter/material.dart';
import 'package:litera_app/features/profile/models/user_model.dart';
import 'package:litera_app/features/profile/viewmodel/profile_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key, required UserModel user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengambil ViewModel dari context
    final viewModel = Provider.of<ProfileViewModel>(context);

    // Guard clause untuk memastikan data user tidak null
    if (viewModel.user == null) {
      return const SizedBox.shrink(); // Tampilkan widget kosong jika user null
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: const BoxDecoration(
        color: Pallete.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(viewModel.user!.profileImageUrl),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Pallete.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Ubah',
                  style: TextStyle(color: Pallete.primaryLightColor, fontSize: 12),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            viewModel.user!.name,
            style: const TextStyle(
              color: Pallete.primaryLightColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            viewModel.user!.username,
            style: const TextStyle(
              color: Pallete.primaryLightColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}