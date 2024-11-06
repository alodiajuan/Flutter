import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top padding for status bar
          SizedBox(height: MediaQuery.of(context).padding.top + 20),
          
          // Contact Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'CONTACT :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Contact Cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildContactCard(
                  title: 'Admin Prodi',
                  subtitle: 'Sistem Informasi Bisnis',
                  phone: '081214374653',
                  color: const Color(0xFFFFE4B5), // Peach color
                ),
                const SizedBox(height: 16),
                _buildContactCard(
                  title: 'Admin Prodi',
                  subtitle: 'Teknik Informatika',
                  phone: '081214374653',
                  color: const Color(0xFF90CAF9), // Light blue color
                ),
                const SizedBox(height: 16),
                _buildContactCard(
                  title: 'Admin Prodi',
                  subtitle: 'PPLS',
                  phone: '081214374653',
                  color: const Color(0xFFFFB6C1), // Light pink color
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildContactCard({
    required String title,
    required String subtitle,
    required String phone,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        _launchWhatsApp(phone);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
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
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                phone,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchWhatsApp(String phone) async {
    final url = 'https://wa.me/$phone'; // WhatsApp API URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset : const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 1, // Set to 1 since we're on the contact page
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
              // Already on contact page
              break;
            case 2:
              Navigator.pushNamed(context, '/notifications');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile_screen');
              break;
          }
        },
      ),
    );
  }
}