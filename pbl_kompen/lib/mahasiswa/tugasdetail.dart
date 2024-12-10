import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Tugas model class
class Tugas {
  final int tugasId;
  final String tugasKode;
  final String tugasNama;
  final String deskripsi;
  final int jamKompen;
  final String statusDibuka;
  final DateTime tanggalMulai;
  final DateTime tanggalAkhir;
  final int kategoriId;
  final int sdmId;

  Tugas({
    required this.tugasId,
    required this.tugasKode,
    required this.tugasNama,
    required this.deskripsi,
    required this.jamKompen,
    required this.statusDibuka,
    required this.tanggalMulai,
    required this.tanggalAkhir,
    required this.kategoriId,
    required this.sdmId,
  });

  factory Tugas.fromJson(Map<String, dynamic> json) {
    return Tugas(
      tugasId: json['tugas_id'],
      tugasKode: json['tugas_kode'],
      tugasNama: json['tugas_nama'],
      deskripsi: json['deskripsi'],
      jamKompen: json['jam_kompen'],
      statusDibuka: json['status_dibuka'],
      tanggalMulai: DateTime.parse(json['tanggal_mulai']),
      tanggalAkhir: DateTime.parse(json['tanggal_akhir']),
      kategoriId: json['kategori_id'],
      sdmId: json['sdm_id'],
    );
  }
}

// The TugasDetail screen where we fetch data
class TugasDetail extends StatelessWidget {
  final int tugasId;

  TugasDetail({Key? key, required this.tugasId}) : super(key: key);

  Future<Tugas> fetchTugas() async {
    final response = await http.get(Uri.parse('http://your-api-url/tugas/$tugasId'));

    if (response.statusCode == 200) {
      return Tugas.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load tugas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tugas>(
      future: fetchTugas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          Tugas tugas = snapshot.data!;

          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: SafeArea(
              child: Column(
                children: [
                  // Back Button and Header
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Text(
                          'Detail Tugas',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Task Name
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      tugas.tugasNama,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Task Description
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(tugas.deskripsi),
                  ),
                  // Task Duration
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Duration: ${tugas.tanggalMulai.toLocal()} - ${tugas.tanggalAkhir.toLocal()}',
                    ),
                  ),
                  // Kompen Hours
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Jam Kompen: ${tugas.jamKompen}'),
                  ),
                  // Status
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Status: ${tugas.statusDibuka}'),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }
}
