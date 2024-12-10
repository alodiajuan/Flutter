import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart'; // Import Config for baseUrl

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1F2739),
              Color(0xFF2A324B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(flex: 7),
                  _buildTitle(),
                  const SizedBox(height: 3),
                  _buildSubtitle(),
                  const Spacer(flex: 2),
                  _buildLoginCard(),
                  const Spacer(flex: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'KOMPEN',
      style: GoogleFonts.mPlus2(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Jurusan Teknologi Informasi',
      style: GoogleFonts.mPlus2(
        fontSize: 20,
        color: Colors.white70,
      ),
    );
  }

  Widget _buildLoginCard() {
    return Container(
      width: 350,
      child: Card(
        color: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedRole;

  final List<String> _roles = [
    'Mahasiswa',
    'Dosen'
  ]; // Role list

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildUsernameField(),
        const SizedBox(height: 10),
        _buildPasswordField(),
        const SizedBox(height: 10),
        _buildRoleDropdown(),
        const SizedBox(height: 20),
        _buildButtonsRow(context),
      ],
    );
  }

  Widget _buildUsernameField() {
    return TextField(
      controller: _usernameController,
      decoration: InputDecoration(
        labelText: 'Username',
        border: const OutlineInputBorder(),
        labelStyle: GoogleFonts.mPlus2(),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(),
        labelStyle: GoogleFonts.mPlus2(),
      ),
    );
  }

  Widget _buildRoleDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Sebagai',
        border: const OutlineInputBorder(),
        labelStyle: GoogleFonts.mPlus2(),
      ),
      value: _selectedRole,
      items: _roles.map((String role) {
        return DropdownMenuItem<String>(
          value: role,
          child: Text(role, style: GoogleFonts.mPlus2()),
        );
      }).toList(),
      icon: const Icon(FeatherIcons.chevronDown),
      onChanged: (String? newValue) {
        setState(() {
          _selectedRole = newValue;
        });
      },
    );
  }

  Widget _buildButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/forgot-password');
          },
          child: Text('Lupa Password?', style: GoogleFonts.mPlus2()),
        ),
        ElevatedButton(
          onPressed: () {
            _handleLogin(context);
          },
          child: Text('Login', style: GoogleFonts.mPlus2()),
        ),
      ],
    );
  }

  void _handleLogin(BuildContext context) async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String? role = _selectedRole;

    // Validasi input
    if (username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username tidak boleh kosong')),
      );
      return;
    }

    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password tidak boleh kosong')),
      );
      return;
    }

    if (role == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan pilih role')),
      );
      return;
    }

    // Melakukan request login ke API
    try {
      final response = await http.post(
        Uri.parse('${Config.baseUrl}/api/loginEndpoint'),  // Periksa endpoint yang benar
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'role': role,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Jika login berhasil
        if (data['status'] == true) {
          // Arahkan ke halaman beranda mahasiswa
          Navigator.pushReplacementNamed(context, '/main');
        } else {
          // Menampilkan pesan kesalahan jika login gagal
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'] ?? 'Login gagal')),
          );
        }
      } else {
        final errorData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorData['message'] ?? 'Login gagal')),
        );
      }
    } catch (e) {
      // Menangani kesalahan koneksi atau request lainnya
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Terjadi kesalahan. Periksa koneksi Anda.')),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
