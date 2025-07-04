import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction_model.dart';

class BalanceViewModel extends ChangeNotifier {
  double _totalBalance = 0.0;
  double get totalBalance => _totalBalance;

  final TextEditingController withdrawAmountController = TextEditingController();
  final TextEditingController eWalletNameController = TextEditingController();
  final TextEditingController eWalletNumberController = TextEditingController();


  int _selectedTabIndex = 0; // 0: Saldo Masuk, 1: Saldo Keluar
  int get selectedTabIndex => _selectedTabIndex;

  late List<TransactionModel> _allTransactions;
  List<TransactionModel> get filteredTransactions {
    final type = _selectedTabIndex == 0 ? TransactionType.masuk : TransactionType.keluar;
    return _allTransactions.where((t) => t.type == type).toList();
  }

  // Helper untuk format mata uang
  String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(amount);
  }

  BalanceViewModel() {
    _fetchData();
  }

  void performWithdrawal(BuildContext context) {
    // 1. Validasi input (contoh sederhana)
    final amountText = withdrawAmountController.text;
    if (amountText.isEmpty || eWalletNameController.text.isEmpty || eWalletNumberController.text.isEmpty) {
      _showErrorSnackbar(context, 'Semua field wajib diisi.');
      return;
    }
    
    final amount = double.tryParse(amountText);
    if (amount == null || amount < 10000) {
      _showErrorSnackbar(context, 'Minimum penarikan adalah Rp 10.000.');
      return;
    }

    if (amount > _totalBalance) {
      _showErrorSnackbar(context, 'Saldo tidak mencukupi.');
      return;
    }

    _totalBalance -= amount;
    _allTransactions.insert(
      0, // Tambahkan ke paling atas daftar
      TransactionModel(
        id: DateTime.now().toIso8601String(),
        title: 'Tarik Saldo',
        description: 'ke ${eWalletNameController.text}',
        amount: amount,
        type: TransactionType.keluar,
        date: DateTime.now(),
      ),
    );

    withdrawAmountController.clear();
    eWalletNameController.clear();
    eWalletNumberController.clear();
    notifyListeners();

    // 4. Tampilkan notifikasi sukses & kembali
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Penarikan saldo berhasil diproses!'), backgroundColor: Colors.green),
    );
    Navigator.of(context).pop();
  }

  void _showErrorSnackbar(BuildContext context, String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }

  void changeTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    withdrawAmountController.dispose();
    eWalletNameController.dispose();
    eWalletNumberController.dispose();
    super.dispose();
  }

  void _fetchData() {
    // Data dummy, nantinya bisa dari API
    _totalBalance = 50000;
    _allTransactions = [
      TransactionModel(id: '1', title: 'Sewa Buku', description: 'Durasi 15 Hari', amount: 8500, type: TransactionType.masuk, date: DateTime.now()),
      TransactionModel(id: '2', title: 'Sewa Buku', description: 'Durasi 15 Hari', amount: 8500, type: TransactionType.masuk, date: DateTime.now().subtract(const Duration(days: 1))),
      TransactionModel(id: '3', title: 'Denda', description: 'Telat 5 Hari', amount: 10000, type: TransactionType.masuk, date: DateTime.now().subtract(const Duration(days: 2))),
      TransactionModel(id: '4', title: 'Tarik Saldo', description: 'Ke E-Wallet', amount: 25000, type: TransactionType.keluar, date: DateTime.now().subtract(const Duration(days: 3))),
    ];
  }
}