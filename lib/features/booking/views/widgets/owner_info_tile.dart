import 'package:flutter/material.dart';
import '../../models/booking_model.dart';

class OwnerInfoTile extends StatelessWidget {
  final BookingModel details;
  const OwnerInfoTile({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      elevation: 0,
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(details.ownerImageUrl)),
        title: Text(details.ownerName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(details.ownerLocation),
      ),
    );
  }
}