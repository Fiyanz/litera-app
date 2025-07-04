import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/auth/view/pages/reset_password_page.dart';
import 'package:litera_app/features/balance/views/pages/balance_page.dart';
import 'package:litera_app/features/booking/views/pages/booking_confirmation_page.dart';
import 'package:litera_app/features/history/views/pages/history_page.dart';
import 'package:litera_app/features/profile/view/pages/edit_address_page.dart';
import 'package:litera_app/features/profile/view/pages/edit_profile_page.dart';
import 'package:litera_app/features/profile/view/pages/my_book_page.dart';
import 'package:litera_app/features/profile/view/widgets/logout_confirmation_dialog.dart';
import 'package:litera_app/features/profile/viewmodel/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class MenuSection extends StatelessWidget {
  final VoidCallback onLogout;
  const MenuSection({Key? key, required this.onLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          _buildIconMenu(context),
          const SizedBox(height: 20),
          const Divider(thickness: 0.5, indent: 16, endIndent: 16),
          _buildTextMenu(context),
        ],
      ),
    );
  }

  Widget _buildIconMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _menuItem(
          icon: Icons.menu_book_outlined,
          label: 'Buku Saya',
          onTap: () {
            // Arahkan ke halaman Buku Saya
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyBooksPage()));
          },
        ),
        _menuItem(
          icon: Icons.account_balance_wallet_outlined,
          label: 'Saldo',
          onTap: () {
            // Navigasi ke halaman Saldo
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BalancePage()));
          },
        ),
        _menuItem(
          icon: Icons.history,
          label: 'History',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryPage()));
          },
        ),
      ],
    );
  }

  // Tambahkan parameter VoidCallback onTap
  Widget _menuItem({required IconData icon, required String label, required VoidCallback onTap}) {
    // Bungkus dengan InkWell atau GestureDetector agar bisa di-klik
    return InkWell(
      onTap: onTap, // Gunakan fungsi onTap yang diberikan
      borderRadius: BorderRadius.circular(16), // Efek ripple yang rapi
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Pallete.primaryColor, width: 1.5),
              ),
              child: Icon(icon, color: Pallete.primaryColor, size: 30),
            ),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(color: Pallete.textColor, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextMenu(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person_outline, color: Pallete.textGrayColor),
          title: const Text('Akun', style: TextStyle(color: Pallete.textColor, fontSize: 16)),
          trailing: const Icon(Icons.chevron_right, color: Pallete.textGrayColor),
          onTap: () {
            // Ambil instance ViewModel yang ada
            final viewModel = Provider.of<ProfileViewModel>(context, listen: false);
            
            // Navigasi ke EditProfilePage sambil memberikan ViewModel
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider.value(
                  value: viewModel,
                  child: const EditProfilePage(),
                ),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.person_outline, color: Pallete.textGrayColor),
          title: const Text('Alamat', style: TextStyle(color: Pallete.textColor, fontSize: 16)),
          trailing: const Icon(Icons.chevron_right, color: Pallete.textGrayColor),
          onTap: () {
            // Ambil instance ViewModel yang ada
            final viewModel = Provider.of<ProfileViewModel>(context, listen: false);
            
            // Navigasi ke EditAddressPage sambil memberikan ViewModel
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider.value(
                  value: viewModel,
                  child: const EditAddressPage(),
                ),
              ),
            );
          }
        ),
        ListTile(
          leading: const Icon(Icons.lock_outline, color: Pallete.textGrayColor),
          title: const Text('Atur Ulang Kata Sandi', style: TextStyle(color: Pallete.textColor, fontSize: 16)),
          trailing: const Icon(Icons.chevron_right, color: Pallete.textGrayColor),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ResetPasswordPage()),
            );
          },
        ),

        ListTile(
          leading: const Icon(Icons.receipt_long_outlined, color: Pallete.textGrayColor),
          title: const Text('Konfirmasi Sewa', style: TextStyle(color: Pallete.textColor, fontSize: 16)),
          trailing: const Icon(Icons.chevron_right, color: Pallete.textGrayColor),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookingConfirmationPage()),
            );
          }
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Pallete.errorColor),
          title: const Text('Logout', style: TextStyle(color: Pallete.errorColor, fontSize: 16)),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext dialogContext) {
                return LogoutConfirmationDialog(
                  onConfirm: onLogout, // Berikan fungsi onLogout ke dialog
                );
              },
            );
          },
        ),
      ],
    );
  }

  // Widget _listTile(String title, IconData icon) {
  //   return ListTile(
  //     leading: Icon(icon, color: Pallete.textGrayColor),
  //     title: Text(title, style: const TextStyle(color: Pallete.textColor, fontSize: 16)),
  //     trailing: const Icon(Icons.chevron_right, color: Pallete.textGrayColor),
  //     onTap: () {},
  //   );
  // }
}