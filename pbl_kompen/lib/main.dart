import 'package:flutter/material.dart';
import 'maindua.dart'; // Halaman Mulai Kedua
import 'loginpage.dart'; // Halaman Login
import 'forgotpasswordpage.dart'; // Halaman Lupa Kata Sandi
import 'loginsuccess.dart'; // Halaman Login Sukses
import 'beranda.dart'; // Halaman Beranda
import 'tugas1.dart'; // Halaman Tugas 1 (baru)
import 'tugasdetail.dart'; // Halaman Detail Tugas
import 'profile_screen.dart'; // Halaman Profil
import 'changepw.dart'; // Halaman Ubah Kata Sandi
import 'notifikasi1.dart'; // Halaman Notifikasi 1
import 'notifikasi2.dart'; // Halaman Notifikasi 2
import 'contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KOMPEN App',
      initialRoute: '/start', // Halaman awal saat aplikasi dimulai
      routes: {
        '/start': (context) => const Maindua(), // Halaman Mulai
        '/login': (context) => const LoginPage(), // Halaman Login
        '/forgot-password': (context) =>
            const ForgotPasswordPage(), // Halaman Lupa Kata Sandi
        '/login-success': (context) =>
            const LoginSuccess(), // Halaman Login Sukses
        '/beranda': (context) => const HomePage(), // Halaman Beranda
        '/tugas1': (context) => const Tugas1(), // Halaman Tugas 1 (baru)
        '/tugasdetail': (context) =>
            const TugasDetail(), // Halaman Tugas Detail
        '/notifikasi1': (context) =>
            const InformasiKompenScreen(), // Halaman Notifikasi 1
        '/notifikasi2': (context) => HasilKompenPage(), // Halaman Notifikasi 2
        '/profile_screen': (context) => const ProfileScreen(), // Halaman Profil
        '/changepw': (context) => const ChangePw(), // Halaman Ubah Kata Sandi
        '/contact': (context) => const ContactScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}