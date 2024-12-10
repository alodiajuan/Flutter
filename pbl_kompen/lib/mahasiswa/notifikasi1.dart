import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'hasiltugaspage.dart';

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
      home: const NotifikasiScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({Key? key}) : super(key: key);

  @override
  _NotifikasiScreenState createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  bool _isInformasiKompenPressed = true;
  bool _isHasilKompenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      
      body: Column(
        children: [
          _buildTopNavigation(),
          Expanded(
            child: _isInformasiKompenPressed ? _buildInformasiKompenList() : _buildHasilKompenList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTopNavigation() {
    return Container(
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
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                  color: _isInformasiKompenPressed ? const Color(0xFF1A237E) : Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: const Text(
                  'Informasi Kompen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
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
                padding: const EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                  color: _isHasilKompenPressed ? const Color(0xFF1A237E) : Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: const Text(
                  'Hasil Kompen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
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

  Widget _buildInformasiKompenList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildKompenCard(name: "BAMBANG R.", status: "Pengajuan Penjadwalan Ulang\nKompen Sedang Diproses.", backgroundColor: const Color(0xFFFFE5D9)),
        const SizedBox(height: 12),
        _buildKompenCard(name: "BAMBANG R.", status: "Pengajuan Tugas Kompen Telah\nDiterima.", backgroundColor: const Color(0xFFFFE5B4)),
        const SizedBox(height: 12),
        _buildKompenCard(name: "BELLA CHAN.", status: "Pengajuan Penjadwalan Ulang\nKompen Sedang Diproses.", backgroundColor: const Color(0xFFFFE5D9)),
        const SizedBox(height: 12),
        _buildKompenCard(name: "BELLA CHAN.", status: "Pengajuan Tugas Kompen Telah\nDitolak.", backgroundColor: Colors.red, textColor: Colors.white),
      ],
    );
  }

  Widget _buildHasilKompenList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HasilTugasPage()),
            );
          },
          child: const HasilKompenCard(
            name: "Hendra Pradibta, S.E., M.Sc.",
            status: "Tugas Kompen Telah Selesai",
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HasilTugasPage()),
            );
          },
          child: const HasilKompenCard(
            name: "Hendra Pradibta, S.E., M.Sc.",
            status: "Tugas Kompen Telah Selesai",
          ),
        ),
        const SizedBox(height: 12),
        const HasilKompenCard(
          name: "Hendra Pradibta, S.E., M.Sc.",
          status: "Tugas Kompen ditolak, harap revisi kembali",
          isRejected: true,
        ),
      ],
    );
  }

  Widget _buildKompenCard({required String name, required String status, required Color backgroundColor, Color textColor = Colors.black}) {
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

class HasilKompenCard extends StatelessWidget {
  final String name;
  final String status;
  final bool isRejected;

  const HasilKompenCard({Key? key, required this.name, required this.status, this.isRejected = false}) : super(key: key);

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
        child: Row(
          children: [
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
            if (!isRejected)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HasilTugasPage()),
                  );
                },
                child: const Icon(
                  FeatherIcons.file,
                  color: Colors.white,
                  size: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
