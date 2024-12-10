import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

// Mahasiswa Imports
import 'mahasiswa/beranda.dart';
import 'mahasiswa/notifikasi1.dart';
import 'mahasiswa/contact.dart';
import 'mahasiswa/profile_screen.dart';

import 'loginpage.dart'; // Halaman Login
import 'forgotpasswordpage.dart'; // Halaman Lupa Kata Sandi
import 'loginsuccess.dart'; // Halaman Login Sukses

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KOMPEN App',
      initialRoute: '/login', // Mulai dari halaman login
      routes: {
        '/login': (context) => const LoginPage(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/loginsuccess': (context) => const LoginSuccess(),
        '/main': (context) => const MainScreen(), // Beranda Mahasiswa dengan navbar
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<Widget> _pages = [
    const HomePage(), // Halaman Beranda Mahasiswa
    const NotifikasiScreen(), // Halaman Notifikasi Mahasiswa
    const ContactScreen(), // Halaman Kontak Mahasiswa
    const ProfileScreen(), // Halaman Profil Mahasiswa
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.bell),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.messageSquare),
            label: 'Kontak',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
