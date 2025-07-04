import 'package:flutter/material.dart';
import 'package:litera_app/features/balance/models/transaction_model.dart';

class TransactionItemTile extends StatelessWidget {
  final TransactionModel transaction;
  final String formattedAmount;

  const TransactionItemTile({
    super.key,
    required this.transaction,
    required this.formattedAmount,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.type == TransactionType.masuk;
    final amountColor = isIncome ? Colors.green : Colors.red;
    final amountSign = isIncome ? '+' : '-';
    final iconData = isIncome ? Icons.arrow_downward : Icons.arrow_upward;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: amountColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(iconData, color: amountColor),
        ),
        title: Text(transaction.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(transaction.description),
        trailing: Text(
          '$amountSign $formattedAmount',
          style: TextStyle(color: amountColor, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}