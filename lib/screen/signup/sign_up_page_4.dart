import 'package:flutter/material.dart';
import 'sign_up_page_5.dart';
import '../../models/sign_up_form_data.dart'; // Correct path

class SignUpPage4 extends StatefulWidget {
  final bool isPremium; // Received from Page 3

  const SignUpPage4({Key? key, required this.isPremium}) : super(key: key);

  @override
  State<SignUpPage4> createState() => _SignUpPage4State();
}

class _SignUpPage4State extends State<SignUpPage4> {
  final _formKey = GlobalKey<FormState>();

  String _title = 'Mr';
  String _nicOrPassport = 'NIC';
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _mobileCtrl = TextEditingController(text: '711234567'); // Pre-filled
  final _nicCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _nicCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 60),

                      // Logo
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      const SizedBox(height: 8),

                      const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 8),

                      const Center(
                        child: Text(
                          'Hello there! Let\'s create your account.',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Step Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _stepCheck(),
                          _stepLine(),
                          _stepCheck(),
                          _stepLine(),
                          _stepCheck(),
                          _stepLine(),
                          _stepCheck(),
                          _stepLine(),
                          _stepCircle('5'),
                        ],
                      ),
                      const SizedBox(height: 32),

                      const Text(
                        'Member Details',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),

                      // Title Dropdown
                      DropdownButtonFormField<String>(
                        value: _title,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        ),
                        items: ['Mr', 'Mrs', 'Miss', 'Dr', 'Prof']
                            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) => setState(() => _title = val!),
                      ),
                      const SizedBox(height: 12),

                      // First Name
                      TextFormField(
                        controller: _firstNameCtrl,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      // Last Name
                      TextFormField(
                        controller: _lastNameCtrl,
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      // Email
                      TextFormField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      // Mobile (disabled)
                      TextFormField(
                        controller: _mobileCtrl,
                        enabled: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFE3F2FD),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // NIC / Passport Radio
                      Row(
                        children: [
                          _radioTile('NIC', _nicOrPassport == 'NIC'),
                          const SizedBox(width: 32),
                          _radioTile('Passport', _nicOrPassport == 'Passport'),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // NIC / Passport Field
                      TextFormField(
                        controller: _nicCtrl,
                        decoration: InputDecoration(
                          labelText: _nicOrPassport == 'NIC' ? 'NIC Number' : 'Passport Number',
                          border: const OutlineInputBorder(),
                        ),
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 12),

                      // Password
                      TextFormField(
                        controller: _passwordCtrl,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                        validator: (v) => v!.length < 6 ? 'Min 6 characters' : null,
                      ),
                      const SizedBox(height: 12),

                      // Confirm Password
                      TextFormField(
                        controller: _confirmPasswordCtrl,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => v != _passwordCtrl.text ? 'Passwords do not match' : null,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black87,
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        fixedSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Previous', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Create data object
                          final formData = SignUpFormData(
                            title: _title,
                            firstName: _firstNameCtrl.text.trim(),
                            lastName: _lastNameCtrl.text.trim(),
                            email: _emailCtrl.text.trim(),
                            mobile: _mobileCtrl.text,
                            nicOrPassportNumber: _nicCtrl.text.trim(),
                            isPremium: widget.isPremium, // Passed from Page 3
                          );

                          // Navigate to Summary Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SignUpPage5(formData: formData),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0000CC),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        fixedSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Next', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widgets
  Widget _stepCheck() {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF0000CC)),
      child: const Icon(Icons.check, color: Colors.white, size: 20),
    );
  }

  Widget _stepCircle(String text) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Center(
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget _stepLine() {
    return Container(width: 30, height: 2, color: Colors.grey.shade300);
  }

  Widget _radioTile(String title, bool selected) {
    return GestureDetector(
      onTap: () => setState(() => _nicOrPassport = title),
      child: Row(
        children: [
          Radio<String>(
            value: title,
            groupValue: _nicOrPassport,
            onChanged: (val) => setState(() => _nicOrPassport = val!),
            activeColor: const Color(0xFF0000CC),
          ),
          Text(title),
        ],
      ),
    );
  }
}