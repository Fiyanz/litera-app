import 'package:flutter/material.dart';
import 'package:litera_app/features/notification/viewmodels/notification_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/notification_item.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotificationViewModel(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('Notifikasi', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Pallete.primaryLightColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Consumer<NotificationViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                // 1. Tab Bar
                CustomTabBar(
                  selectedIndex: viewModel.selectedTabIndex,
                  onTabChanged: (index) => viewModel.changeTab(index),
                ),

                // 2. Daftar Notifikasi
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.filteredNotifications.length,
                    itemBuilder: (context, index) {
                      final notification = viewModel.filteredNotifications[index];
                      return NotificationItem(notification: notification);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}