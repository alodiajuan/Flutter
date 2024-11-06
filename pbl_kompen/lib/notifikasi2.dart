import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

class HasilKompenPage extends StatefulWidget {
  @override
  _HasilKompenPageState createState() => _HasilKompenPageState();
}

class _HasilKompenPageState extends State<HasilKompenPage> {
  bool _isInformasiKompenPressed = false;
  bool _isHasilKompenPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isInformasiKompenPressed = true;
                      _isHasilKompenPressed = false;
                    });
                    Navigator.pushNamed(context, '/notifikasi1'); // Navigate to Informasi Kompen
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                    decoration: BoxDecoration(
                      color: _isInformasiKompenPressed ? const Color(0xFF1A237E) : Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Informasi Kompen',
                      style: TextStyle(
                        color: _isInformasiKompenPressed ? Colors.white : Colors.black54,
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
                    // You can also navigate to another screen here if needed
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20 ),
                    decoration: BoxDecoration(
                      color: _isHasilKompenPressed ? const Color(0xFF1A237E) : Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Hasil Kompen',
                      style: TextStyle(
                        color: _isHasilKompenPressed ? Colors.white : Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildKompenItem(name: "BAMBANG R.", description: "Pengajuan Penjadwalan Ulang\nKompen Sedang Diproses."),
          const SizedBox(height: 12),
          _buildKompenItem(name: "BAMBANG R.", description: "Pengajuan Tugas Kompen Telah\nDiterima."),
          const SizedBox(height: 12),
          _buildKompenItem(name: "BELLA CHAN.", description: "Pengajuan Penjadwalan Ulang\nKompen Sedang Diproses."),
          const SizedBox(height: 12),
          _buildKompenItem(name: "BELLA CHAN.", description: "Pengajuan Tugas Kompen Telah\nDitolak."),
          const SizedBox(height: 12),
          _buildKompenItem(name: "BAMBANG R.", description: "Pengajuan Penjadwalan Ulang\nKompen Sedang Diproses."),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildKompenItem({required String name, required String description}) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14.0,
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
      selectedItemColor: Colors.blue ,
      unselectedItemColor: Colors.grey,
      items: [
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