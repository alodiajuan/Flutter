import 'package:flutter/material.dart';
import 'maindua.dart'; // Halaman Mulai Kedua
import 'loginpage.dart'; // Halaman Login
import 'forgotpasswordpage.dart'; // Halaman Lupa Kata Sandi
import 'loginsuccess.dart'; // Halaman Login Sukses
import 'beranda.dart'; // Halaman Beranda
import 'tugas1.dart'; // Halaman Tugas 1 (baru)
import 'tugasdetail.dart'; // Halaman Detail Tugas
import 'profile_screen.dart'; // Corrected import with .dart extension
import 'changepw.dart'; // Ensure this file exists

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
        '/forgot-password': (context) => const ForgotPasswordPage(), // Halaman Lupa Kata Sandi
        '/login-success': (context) => const LoginSuccess(), // Halaman Login Sukses
        '/beranda': (context) => const HomePage(), // Halaman Beranda
        '/tugas1': (context) => const Tugas1(), // Halaman Tugas 1 (baru)
        '/tugasdetail': (context) => const TugasDetail(), // Halaman Tugas Detail
        '/profile_screen': (context) => const ProfileScreen(), // Profile Screen Route
        '/changepw': (context) => const ChangePw(), // Changed to a comma
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
