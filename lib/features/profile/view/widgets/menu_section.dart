import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/profile/view/pages/my_book_page.dart';

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
          icon: Icons.book_outlined,
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
            // TODO: Arahkan ke halaman Saldo
            print('Navigasi ke halaman Saldo');
          },
        ),
        _menuItem(
          icon: Icons.download_for_offline_outlined,
          label: 'Dipinjam',
          onTap: () {
            // TODO: Arahkan ke halaman Dipinjam
            print('Navigasi ke halaman Dipinjam');
          },
        ),
        _menuItem(
          icon: Icons.history,
          label: 'History',
          onTap: () {
            // TODO: Arahkan ke halaman History
            print('Navigasi ke halaman History');
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
        _listTile('Akun', Icons.person_outline),
        _listTile('Alamat', Icons.location_on_outlined),
        ListTile(
          leading: const Icon(Icons.logout, color: Pallete.errorColor),
          title: const Text('Logout', style: TextStyle(color: Pallete.errorColor, fontSize: 16)),
          onTap: onLogout,
        ),
      ],
    );
  }

  Widget _listTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Pallete.textGrayColor),
      title: Text(title, style: const TextStyle(color: Pallete.textColor, fontSize: 16)),
      trailing: const Icon(Icons.chevron_right, color: Pallete.textGrayColor),
      onTap: () {},
    );
  }
}