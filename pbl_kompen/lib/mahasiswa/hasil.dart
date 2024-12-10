import 'package:flutter/material.dart';
// import 'qrcode.dart'; // Mengimpor file qrcode.dart

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Hasil Tugas',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nomor :',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Detail',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // QrCodeWidget(data: 'Zefania-224176011-Tugas-Praktikum'), // Menggunakan widget QrCodeWidget
                ],
              ),
              const SizedBox(height: 8),
              _buildDetailRow('Nama', 'Zefania Yizreel Nefrit Sindhoe'),
              _buildDetailRow('NIM', '224176011'),
              const SizedBox(height: 16),
              _buildDetailRow('Nama Pemberi Tugas', 'Hendra Pradibta, S.E., M.Sc.'),
              const SizedBox(height: 16),
              _buildDetailRow('Nama Kompen', 'Tugas Praktikum'),
              _buildDetailRow('Jenis Tugas Kompen', 'Penelitian'),
              _buildDetailRow('Nilai Jam Kompen', '4:00'),
              const SizedBox(height: 16),
              _buildDetailRow('Tanggal', '22/10/2024 - 23/10/2024'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              '$label :',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
