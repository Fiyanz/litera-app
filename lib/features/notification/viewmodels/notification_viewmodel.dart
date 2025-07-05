import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationViewModel extends ChangeNotifier {
  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  late List<NotificationModel> _allNotifications;
  List<NotificationModel> get filteredNotifications {
    final type = NotificationType.values[_selectedTabIndex];
    return _allNotifications.where((notif) => notif.type == type).toList();
  }

  NotificationViewModel() {
    _fetchNotifications();
  }

  void changeTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void _fetchNotifications() {
    // Data dummy, nantinya bisa dari API
    _allNotifications = [
      NotificationModel(
        id: '1',
        title: 'Saldo diperbarui',
        body: "Penyewaan buku “Laut Bercerita” telah selesai & dana sebesar Rp 7.500 telah ditambahkan ke Saldo Anda. Silakan cek Saldo untuk melihatnya",
        type: NotificationType.keuangan,
        createdAt: DateTime.now(),
      ),
      NotificationModel(
        id: '2',
        title: 'Penarikan dana',
        body: "Penarikan dana sejumlah Rp 50.000 berhasil ditransfer ke E-Wallet mu",
        type: NotificationType.keuangan,
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      NotificationModel(
        id: '3',
        title: 'Tawaran Spesial!',
        body: "Dapatkan diskon 50% untuk penyewaan buku fiksi minggu ini.",
        type: NotificationType.tawaran,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
       NotificationModel(
        id: '4',
        title: 'Foto telah diupload',
        body: "Peminjam telah mengunggah foto buku sebagai bukti penerimaan.",
        type: NotificationType.buku,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }
}