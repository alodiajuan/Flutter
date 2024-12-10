import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;

class HasilTugasPage extends StatelessWidget {
  const HasilTugasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(FeatherIcons.arrowLeft),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Hasil Tugas'),
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.download),
            onPressed: () {
              _generateAndDownloadPdf();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Nomor:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Image.asset(
                      'assets/images/qr_code.png',
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Detail', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildDetailRow('Nama', 'Zefania Yizreel Nefrit Sindhoe'),
                _buildDetailRow('NIM', '2241760117'),
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
            width: 140,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Future<void> _generateAndDownloadPdf() async {
    final pdf = pw.Document();

    // Memuat gambar logo Polinema dari aset
    final logoBytes = await rootBundle.load('assets/images/Logo-polinema.png');
    final logo = pw.MemoryImage(logoBytes.buffer.asUint8List());

    // Memuat gambar QR Code dari aset
    final qrBytes = await rootBundle.load('assets/images/qr_code.png');
    final qrCode = pw.MemoryImage(qrBytes.buffer.asUint8List());

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Bagian Header
              pw.Table(
                border: pw.TableBorder.all(width: 0.5),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Image(logo, width: 100, height: 100),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            pw.Text(
                              'KEMENTERIAN PENDIDIKAN, KEBUDAYAAN, RISET, DAN TEKNOLOGI',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11),
                            ),
                            pw.Text(
                              'POLITEKNIK NEGERI MALANG',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13),
                            ),
                            pw.Text(
                              'Jl. Soekarno-Hatta No. 9 Malang 65141',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 10),
                            ),
                            pw.Text(
                              'Telepon (0341) 404424 Pes. 101-105, 0341-404420, Fax. (0341) 404420',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 10),
                            ),
                            pw.Text(
                              'Laman: www.polinema.ac.id',
                              textAlign: pw.TextAlign.center,
                              style: pw.TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              pw.SizedBox(height: 16),

              // Judul bukti selesai kompen
              pw.Text('BUKTI SELESAI KOMPEN', textAlign: pw.TextAlign.center, style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),

              pw.SizedBox(height: 16),

              // Detail informasi
              _buildPdfDetailRow('Nama', 'Zefania Yizreel Nefrit Sindhoe'),
              _buildPdfDetailRow('NIM', '2241760117'),
              pw.SizedBox(height: 16),
              _buildPdfDetailRow('Nama Pemberi Tugas', 'Hendra Pradibta, S.E., M.Sc.'),
              pw.SizedBox(height: 16),
              _buildPdfDetailRow('Nama Kompen', 'Tugas Praktikum'),
              _buildPdfDetailRow('Jenis Tugas Kompen', 'Penelitian'),
              _buildPdfDetailRow('Nilai Jam Kompen', '4:00'),
              pw.SizedBox(height: 16),
              _buildPdfDetailRow('Tanggal', '22/10/2024 - 23/10/2024'),

              pw.SizedBox(height: 16),

              // QR Code
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Image(qrCode, width: 100, height: 100),
                ],
              ),
            ],
          );
        },
      ),
    );

    // Mengunduh PDF menggunakan package printing
    await Printing.sharePdf(bytes: await pdf.save(), filename: 'hasil_tugas.pdf');
  }

  pw.Widget _buildPdfDetailRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4.0),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            width: 140,
            child: pw.Text(
              label,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.Text(': '),
          pw.Expanded(
            child: pw.Text(value),
          ),
        ],
      ),
    );
  }
}
