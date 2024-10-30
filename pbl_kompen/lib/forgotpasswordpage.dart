import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
            // Top Left Curve
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A324B),
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
            ),
            // Back Button
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                icon: const Icon(
                  FeatherIcons.arrowLeftCircle,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous page
                },
              ),
            ),
            // Main Content
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(flex: 7),
                  const Text(
                    'KOMPEN',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'Jurusan Teknologi Informasi',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                  const Spacer(flex: 2),
                  // Lupa Password Card
                  Container(
                    width: 350,
                    child: Card(
                      color: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: ForgotPasswordForm(),
                      ),
                    ),
                  ),
                  const Spacer(flex: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _nimController = TextEditingController();
  final _emailController = TextEditingController();
  DateTime? _selectedDate;
  String? errorMessage;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _validateFields() {
    setState(() {
      errorMessage = null; // Reset error message
      if (_nimController.text.isEmpty || _selectedDate == null || _emailController.text.isEmpty) {
        errorMessage = '*harap isi terlebih dahulu';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // NIM Field
        TextField(
          controller: _nimController,
          decoration: const InputDecoration(
            labelText: 'NIM',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        // Date of Birth Field
        TextField(
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            labelText: 'Tanggal Lahir',
            border: const OutlineInputBorder(),
            hintText: _selectedDate != null
                ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                : 'Pilih tanggal lahir',
          ),
        ),
        const SizedBox(height: 10),
        // Email Field
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              errorMessage!,
              style: TextStyle(color: Colors.red),
            ),
          ),
        const SizedBox(height: 20),
        // Reset Password Button
        ElevatedButton(
          onPressed: () {
            _validateFields();
            if (errorMessage == null) {
              // Process password reset logic
              String nim = _nimController.text;
              String email = _emailController.text;

              // Simulate password reset process
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Reset Password Berhasil!')),
              );

              // Navigate to LoginSuccess page
              Navigator.pushNamed(context, '/login-success');
            } else {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(errorMessage!)),
              );
            }
          },
          child: const Text('Reset Password'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nimController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}