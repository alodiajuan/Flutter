import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KOMPEN App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InformasiKompenScreen(), // Setel halaman awal
      debugShowCheckedModeBanner: false,
    );
  }
}

class InformasiKompenScreen extends StatefulWidget {
  const InformasiKompenScreen({Key? key}) : super(key: key);

  @override
  _InformasiKompenScreenState createState() => _InformasiKompenScreenState();
}

class _InformasiKompenScreenState extends State<InformasiKompenScreen> {
  bool _isInformasiKompenPressed = true;
  bool _isHasilKompenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Top Navigation Tabs
          _buildTopNavigation(),
          // List Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildKompenCard(
                  name: "BAMBANG R.",
                  status: "Pengajuan Penjadwalan Ulang\nKompen Sedang Diproses.",
                  backgroundColor: const Color(0xFFFFE5D9),
                ),
                const SizedBox(height: 12),
                _buildKompenCard(
                  name: "BAMBANG R.",
                  status: "Pengajuan Tugas Kompen Telah\nDiterima.",
                  backgroundColor: const Color(0xFFFFE5B4),
                ),
                const SizedBox(height: 12),
                _buildKompenCard(
                  name: "BELLA CHAN.",
                  status: "Pengajuan Penjadwalan Ulang\nKompen Sedang Diproses.",
                  backgroundColor: const Color(0xFFFFE5D9),
                ),
                const SizedBox(height: 12),
                _buildKompenCard(
                  name: "BELLA CHAN.",
                  status: "Pengajuan Tugas Kompen Telah\nDitolak.",
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 12),
                _buildKompenCard(
                  name: "BAMBANG R.",
                  status: "Pengajuan Penjadwalan Ulang\nKompen Sedang Diproses.",
                  backgroundColor: const Color(0xFFFFE5D9),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTopNavigation() {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isInformasiKompenPressed = true;
                  _isHasilKompenPressed = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: _isInformasiKompenPressed
                      ? const Color(0xFF1A237E)
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Informasi Kompen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _isInformasiKompenPressed
                        ? Colors.white
                        : Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isHasilKompenPressed = true;
                  _isInformasiKompenPressed = false;
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HasilKompenScreen()),
                );
              },
              child: Container (
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: _isHasilKompenPressed
                      ? const Color(0xFF1A237E)
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Hasil Kompen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _isHasilKompenPressed
                        ? Colors.white
                        : Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKompenCard({
    required String name,
    required String status,
    required Color backgroundColor,
    Color textColor = Colors.black,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  name,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              status,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FeatherIcons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(FeatherIcons.messageCircle),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(FeatherIcons.bell),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(FeatherIcons.user),
          label: '',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/beranda');
            break;
          case 1:
            Navigator.pushNamed(context, '/contact');
            break;
          case 2:
            Navigator.pushNamed(context, '/notifications');
            break;
          case 3:
            Navigator.pushNamed(context, '/profile_screen');
            break;
        }
      },
    );
  }
}

class HasilKompenScreen extends StatefulWidget {
  const HasilKompenScreen({Key? key}) : super(key: key);

  @override
  _HasilKompenScreenState createState() => _HasilKompenScreenState();
}

class _HasilKompenScreenState extends State<HasilKompenScreen> {
  bool _isInformasiKompenPressed = false;
  bool _isHasilKompenPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Top Navigation Tabs
          _buildTopNavigation(),
          // Hasil Kompen Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                HasilKompenCard(
                  name: "Hendra Pradibta, S.E., M.Sc.",
                  status: "Tugas Kompen Telah Selesai",
                ),
                SizedBox(height: 12),
                HasilKompenCard(
                  name: "Hendra Pradibta, S.E., M.Sc.",
                  status: "Tugas Kompen Telah Selesai",
                ),
                SizedBox(height: 12),
                HasilKompenCard(
                  name: "Hendra Pradibta, S.E., M.Sc.",
                  status: "Tugas Kompen ditolak, harap revisi kembali",
                  isRejected: true,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildTopNavigation() {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isInformasiKompenPressed = true;
                  _isHasilKompenPressed = false;
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InformasiKompenScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: _isInformasiKompenPressed
                      ? const Color(0xFF1A237E)
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Informasi Kompen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _isInformasiKompenPressed
                        ? Colors.white
                        : Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isHasilKompenPressed = true;
                  _isInformasiKompenPressed = false;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: _isHasilKompenPressed
                      ? const Color(0xFF1A237E)
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Hasil Kompen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _isHasilKompenPressed
                        ? Colors.white
                        : Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 1, // Set to 1 since we're on the contact page
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.messageCircle),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.bell),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.user),
            label: '',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/beranda');
              break;
            case 1:
              // Already on contact page
              break;
            case 2:
              Navigator.pushNamed(context, '/notifications');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile_screen');
              break;
          }
        },
      ),
    );
  }
}

class HasilKompenCard extends StatelessWidget {
  final String name;
  final String status;
  final bool isRejected;

  const HasilKompenCard({
    Key? key,
    required this.name,
    required this.status,
    this.isRejected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A237E),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          if (!isRejected) // Tampilkan ikon hanya jika tidak ditolak
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman HasilKompen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HasilKompenScreen()),
                );
              },
              child: const Icon(
                FeatherIcons.file, // Menggunakan FeatherIcons
                color: Colors.white,
                size: 20,
              ),
            ),
        ]),
      ),
    );
  }
}