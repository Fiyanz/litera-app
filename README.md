# Litera App

Aplikasi mobile untuk meminjam buku secara digital. Dibangun dengan Flutter.

## Deskripsi

Litera App adalah sebuah platform persewaan buku digital yang memungkinkan pengguna untuk menemukan dan meminjam berbagai macam buku langsung dari sekitar mereka. Aplikasi ini ditujukan untuk para pecinta buku yang mencari cara mudah dan nyaman untuk mengakses literatur.

## Fitur Utama

-   **Autentikasi Pengguna**: Sistem login dan registrasi yang aman.
-   **Katalog Buku**: Jelajahi koleksi buku yang luas dengan detail lengkap untuk setiap buku.
-   **Peminjaman Buku**: Pinjam buku favorit Anda dengan mudah untuk dibaca nanti.
-   **Manajemen Saldo**: Isi ulang dan gunakan saldo untuk transaksi peminjaman buku.
-   **Bookmark**: Tandai buku yang ingin Anda baca atau pinjam di kemudian hari.
-   **Riwayat Peminjaman**: Lacak semua buku yang pernah dan sedang Anda pinjam.
-   **Notifikasi**: Dapatkan pemberitahuan tentang status peminjaman, buku baru, dan lainnya.
-   **Profil Pengguna**: Kelola informasi akun dan preferensi Anda.
-   **Fitur Chat**: Berkomunikasi dengan pengguna lain atau dukungan pelanggan.

## Memulai

Untuk menjalankan proyek ini secara lokal, ikuti langkah-langkah berikut:

1.  **Prasyarat**:
    *   Pastikan Anda telah menginstal [Flutter SDK](https://flutter.dev/docs/get-started/install).
    *   Sebuah editor kode seperti [VS Code](https://code.visualstudio.com/) atau [Android Studio](https://developer.android.com/studio).

2.  **Kloning Repositori**:
    ```sh
    git clone <URL_REPOSITORI_ANDA>
    cd litera_app
    ```

3.  **Instal Dependensi**:
    ```sh
    flutter pub get
    ```

4.  **Jalankan Aplikasi**:
    ```sh
    flutter run
    ```

## Struktur Proyek

Proyek ini mengikuti struktur berbasis fitur untuk memisahkan kode berdasarkan fungsionalitasnya.

```
lib/
├── core/         # Widget, tema, dan model bersama
├── features/     # Fitur-fitur utama aplikasi
│   ├── auth/
│   ├── home/
│   ├── book_detail/
│   └── ...
└── main.dart     # Titik masuk utama aplikasi
```
