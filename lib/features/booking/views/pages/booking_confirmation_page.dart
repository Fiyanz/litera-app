import 'package:flutter/material.dart';
import 'package:litera_app/core/theme/app_pallete.dart';
import 'package:litera_app/features/booking/viewmodels/booking_viewmodel.dart';
import 'package:provider/provider.dart';
// Import semua widget baru
import '../widgets/book_details_header.dart';
import '../widgets/owner_info_tile.dart';
import '../widgets/rental_details_card.dart';
import '../widgets/payment_method_selector.dart';
import '../widgets/pickup_method_selector.dart';

class BookingConfirmationPage extends StatelessWidget {
  const BookingConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookingViewModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Konfirmasi Sewa Buku')),
        body: Consumer<BookingViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Susun widget yang sudah dipisah
                  BookDetailsHeader(details: viewModel.bookingDetails),
                  const SizedBox(height: 16),
                  OwnerInfoTile(details: viewModel.bookingDetails),
                  const SizedBox(height: 16),
                  RentalDetailsCard(details: viewModel.bookingDetails),
                  const SizedBox(height: 24),
                  const PaymentMethodSelector(),
                  const SizedBox(height: 24),
                  const PickupMethodSelector(), // Asumsikan widget ini juga sudah dibuat
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Consumer<BookingViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => viewModel.confirmBooking(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Pallete.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Konfirmasi', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            );
          },
        ),
      ),
    );
  }
}