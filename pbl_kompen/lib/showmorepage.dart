class ShowMorePage extends StatelessWidget {
  const ShowMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show More Kompen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildKompenDetailRow('14/09/2024', '2:30'),
            _buildKompenDetailRow('15/09/2024', '4:00'),
            _buildKompenDetailRow('16/09/2024', '1:20'),
            // Add more if necessary
          ],
        ),
      ),
    );
  }

  Widget _buildKompenDetailRow(String date, String time) {
    return Row(
      children: [
        Text(
          date,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        const Spacer(),
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
