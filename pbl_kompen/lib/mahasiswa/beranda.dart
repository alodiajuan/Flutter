import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:pbl_kompen/mahasiswa/tugas1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      routes: {
        '/tugas1': (context) => const Tugas1(),
        '/tugas2': (context) => const Tugas1(),
        '/tugas3': (context) => const Tugas1(),
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with profile
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Zefania Yizreel N. S.',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ListView starts from here
              Expanded(
                child: ListView(
                  children: [
                    // Dropdown and Filter
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[300]!),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: MyDropdown(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Filter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Kompen Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A237E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Jumlah Kompen :',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '8:50',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _buildKompenDetailRow('12/09/2024', '3:50'),
                          const SizedBox(height: 4)
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Progress Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A237E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Progress :',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ProgressItem(
                            title: 'Kompen Praktikum',
                            progress: 0.7,
                            showPercentage: true,
                          ),
                          const SizedBox(height: 8),
                          ProgressItem(
                            title: 'Ikut seminar nasional',
                            progress: 0.0,
                            showPercentage: false,
                          ),
                          const SizedBox(height: 8),
                          ProgressItem(
                            title: 'Fotocopy 100 lembar',
                            progress: 0.1,
                            showPercentage: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Tugas Kompen :',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Tasks List
                    Expanded(
                      child: Column(
                        children: [
                          TaskCard(
                            category: 'Penelitian',
                            lecturer: 'Hendra Pradibta, S.E., M.Sc.',
                            title: 'Kompen Praktikum',
                            progress: '1/1',
                            date: '22/10/2024 - 23/10/2024',
                          ),
                          TaskCard(
                            category: 'Pengabdian',
                            lecturer: 'Dr. Eng. Rosa Andrie Asmara, S.T., M.T.',
                            title: 'Ikut seminar nasional',
                            progress: '2/5',
                            date: '23/10/2024',
                          ),
                          TaskCard(
                            category: 'Teknis',
                            lecturer: 'Dr. Ely Setyo Astuti, S.T., M.T.',
                            title: 'Fotocopy 100 lembar',
                            progress: '0/7',
                            date: '22/10/2024 - 23/10/2024',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKompenDetailRow(String date, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          date,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class MyDropdown extends StatefulWidget {
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? _selectedValue = '2022/2023 Ganjil';
  final List<String> _items = [
    '2022/2023 Ganjil',
    '2022/2023 Genap',
    '2023/2024 Ganjil',
    '2023/2024 Genap',
    '2024/2025 Ganjil',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedValue,
      isExpanded: true,
      underline: const SizedBox(),
      icon: const Icon(FeatherIcons.chevronDown),
      style: const TextStyle(
        fontSize: 12,
      ),
      items: _items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
      },
    );
  }
}

class ProgressItem extends StatelessWidget {
  final String title;
  final double progress;
  final bool showPercentage;

  const ProgressItem({
    super.key,
    required this.title,
    required this.progress,
    required this.showPercentage,
  });

  @override
  Widget build(BuildContext context) {
    Color dotColor = progress > 0 ? Colors.red : Colors.yellow;
    if (title == 'Ikut seminar nasional') {
      dotColor = Colors.yellow;
    }

    return Row(
      children: [
        Container(
          width: 8,
          height: 5,
          decoration: BoxDecoration(
            color: dotColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
        if (showPercentage)
          Text(
            '${(progress * 100).toInt()}%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  final String category;
  final String lecturer;
  final String title;
  final String progress;
  final String date;

  const TaskCard({
    super.key,
    required this.category,
    required this.lecturer,
    required this.title,
    required this.progress,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
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
              Text(
                category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            lecturer,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    progress,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const Icon(
                    FeatherIcons.user,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
