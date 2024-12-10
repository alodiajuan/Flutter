import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

// Model class to match your Laravel model
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
  final SDM? sdm; // Made nullable as per updated model
  final Kategori kategori;

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
    this.sdm,  // Made nullable to match withDefault() in Laravel
    required this.kategori,
  });
}

class SDM {
  final int sdmId;
  final String nama;

  SDM({required this.sdmId, required this.nama});
}

class Kategori {
  final int kategoriId;
  final String nama;

  Kategori({required this.kategoriId, required this.nama});
}

class TugasDetailScreen extends StatelessWidget {
  final Tugas tugas;

  const TugasDetailScreen({Key? key, required this.tugas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    icon: const Icon(FeatherIcons.arrowLeft),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    tugas.tugasNama,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Kategori
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                tugas.kategori.nama,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  backgroundColor: Color(0xFF1A237E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // SDM Name (nullable, check if exists)
            if (tugas.sdm != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                alignment: Alignment.centerLeft,
                child: Text(
                  tugas.sdm!.nama,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    backgroundColor: Color(0xFF1A237E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],

            // Date Range
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                '${DateFormat('dd/MM/yyyy').format(tugas.tanggalMulai)} - ${DateFormat('dd/MM/yyyy').format(tugas.tanggalAkhir)}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),

            // Description Card
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A237E),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'DESKRIPSI :',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${tugas.jamKompen}.00',
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tugas.deskripsi,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Status
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF1A237E),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Status: ${tugas.statusDibuka}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const Spacer(),

            // File Upload Widget
            const FileUploadWidget(),

            // Chat Box Label
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Chat Box :',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),

            // Chat Text Field
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                ),
                maxLines: 3,
              ),
            ),

            // Submit Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Berhasil dikirim!!',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              child: const Text('Ok'),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, '/tugasdetail');
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A237E),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FileUploadWidget extends StatefulWidget {
  const FileUploadWidget({Key? key}) : super(key: key);

  @override
  _FileUploadWidgetState createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  String? fileName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Pengumpulan Tugas :',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Select File (pdf/doc/excel)',
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(12),
              suffixIcon: IconButton(
                icon: const Icon(FeatherIcons.edit),
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'doc', 'xlsx'],
                  );

                  if (result != null) {
                    setState(() {
                      fileName = result.files.single.name;
                    });
                  }
                },
              ),
            ),
            readOnly: true,
            controller: TextEditingController(text: fileName),
          ),
        ),
      ],
    );
  }
}
