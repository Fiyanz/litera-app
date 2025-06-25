import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 40, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Pallete.primaryLightColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari buku, penulis...',
                  hintStyle: TextStyle(
                    color: Pallete.textGrayColor,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Pallete.textGrayColor,
                  ),
                  suffixIcon: Icon(
                    Icons.camera_alt_outlined,
                    color: Pallete.textGrayColor,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0)
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(
              Icons.filter_list,
            color : Pallete.primaryLightColor,
              size: 20,
            ),
            onPressed: () {
              // Implement filter functionality here
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color : Pallete.primaryLightColor,
              size: 20,
            ),
            onPressed: () {
              // Implement notification functionality here
            },
          )
        ],
      ),
    );
  }
}