// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:litera_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:litera_app/main.dart'; 
import 'package:provider/provider.dart';

void main() {
  testWidgets('HomePage displays book lists after loading', (WidgetTester tester) async {
    // Langkah 1: Sediakan provider dan bangun aplikasi
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: MyApp(), 
      ),
    );

    // Langkah 2: Verifikasi kondisi awal (saat loading)
    // pump() akan memproses satu frame.
    await tester.pump(); 
    
    // Kita mengharapkan ada LEBIH DARI SATU CircularProgressIndicator saat loading.
    // Gunakan findsWidgets yang berarti "temukan satu atau lebih".
    print('Mencari CircularProgressIndicator saat loading...');
    expect(find.byType(CircularProgressIndicator), findsWidgets);
    print('✅ Berhasil menemukan loading indicator.');

    // Langkah 3: Tunggu sampai semua proses loading (Future) selesai.
    print('Menunggu proses loading dan animasi selesai...');
    await tester.pumpAndSettle(const Duration(seconds: 3));
    print('✅ Proses loading seharusnya sudah selesai.');

    // Langkah 4: Verifikasi kondisi akhir (setelah loading selesai)
    // Seharusnya tidak ada lagi loading indicator.
    expect(find.byType(CircularProgressIndicator), findsNothing);
    
    // Seharusnya judul sesi dan data buku sudah muncul.
    expect(find.text('Buku yang sering dipinjam'), findsOneWidget);
    expect(find.text('Rekomendasi Untukmu'), findsOneWidget);
    expect(find.text('Laut Bercerita'), findsOneWidget); // Verifikasi salah satu judul buku
    
    print('✅ Tes berhasil, semua widget yang diharapkan telah ditemukan!');
  });
}
