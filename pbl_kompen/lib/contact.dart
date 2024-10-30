import 'package:flutter/material.dart';

class Contactpage extends StatelessWidget {
  const Contactpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildKompenSummary(),
              const SizedBox(height: 20),
              _buildKompenTitle(),
              const SizedBox(height: 20),
              _buildKompenTask(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Hello, Zefania Yizreel N. S.',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'MadimiOne-Regular',
          ),
        ),
        Image.asset('images/profile.png', width: 40, height: 40),
      ],
    );
  }

  Widget _buildKompenSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff101e41),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildKompenRow('Jumlah Kompen :', '8:50'),
          const SizedBox(height: 10),
          _buildKompenRow('12/09/2024', '3:50'),
          const SizedBox(height: 10),
          _buildKompenRow('13/09/2024', '5:00'),
        ],
      ),
    );
  }

  Widget _buildKompenRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontFamily: 'MPLUS2-Regular',
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontFamily: 'MPLUS2-Regular',
          ),
        ),
      ],
    );
  }

  Widget _buildKompenTitle() {
    return const Text(
      'Tugas Kompen :',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xffa2a2a2),
        fontFamily: 'MPLUS2-Medium',
      ),
    );
  }

  Widget _buildKompenTask() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff242c66),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Penelitian',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontFamily: 'MPLUS2-Black',
                ),
              ),
              Text(
                '10/10/2024',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontFamily: 'MPLUS2-Regular',
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'Hendra Pradibta, S.E., M.Sc.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontFamily: 'MPLUS2-Light',
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Kompen Praktikum',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontFamily: 'MPLUS2-SemiBold',
                ),
              ),
              Row(
                children: [
                  const Text(
                    '0/1',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontFamily: 'MPLUS2-Regular',
                    ),
                  ),
                  const SizedBox(width: 5),
                  Image.asset('images/profile.png',
                      width: 13.478, height: 12.916),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
