import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

class HasilKompenScreen extends StatefulWidget {
  const HasilKompenScreen({Key? key}) : super(key: key);

  @override
  _HasilKompenScreenState createState() => _HasilKompenScreenState();
}

class _HasilKompenScreenState extends State<HasilKompenScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildKompenResultCard(
          name: "Hendra Pradibta, S.E., M.Sc.",
          status: "Tugas Kompen Telah Selesai",
          isDone: true,
        ),
        const SizedBox(height: 12),
        _buildKompenResultCard(
          name: "Hendra Pradibta, S.E., M.Sc.",
          status: "Tugas Kompen Telah Selesai",
          isDone: true,
        ),
        const SizedBox(height: 12),
        _buildKompenResultCard(
          name: "Hendra Pradibta, S.E., M.Sc.",
          status: "Tugas Kompen ditolak, harap revisi kembali",
          isDone: false,
        ),
      ],
    );
  }

  Widget _buildKompenResultCard({
    required String name,
    required String status,
    required bool isDone,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A237E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
            Icon(
              Icons.edit,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class KompenMainScreen extends StatefulWidget {
  const KompenMainScreen({Key? key}) : super(key: key);

  @override
  _KompenMainScreenState createState() => _KompenMainScreenState();
}

class _KompenMainScreenState extends State<KompenMainScreen> {
  bool _isInformasiKompenSelected = true;

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
                      _isInformasiKompenSelected = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                    decoration: BoxDecoration(
                      color: _isInformasiKompenSelected 
                          ? const Color(0xFF1A237E) 
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Informasi Kompen',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _isInformasiKompenSelected 
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
                      _isInformasiKompenSelected = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                    decoration: BoxDecoration(
                      color: !_isInformasiKompenSelected 
                          ? const Color(0xFF1A237E) 
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Hasil Kompen',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: !_isInformasiKompenSelected 
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
        ),
      ),
      body: _isInformasiKompenSelected
          ? InformasiKompenContent()
          : HasilKompenScreen(),
      bottomNavigationBar: _buildBottomNavigationBar(),
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

class InformasiKompenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
}