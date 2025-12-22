// lib/screen/signup/sign_up_page_5.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../models/sign_up_form_data.dart';
import 'sign_up_page_6.dart'; // Import the success page

class SignUpPage5 extends StatelessWidget {
  final SignUpFormData formData;

  const SignUpPage5({Key? key, required this.formData}) : super(key: key);

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

                    // Title
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

                    // Step Indicator - All completed
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
                        _stepCheck(),
                      ],
                    ),
                    const SizedBox(height: 32),

                    const Text(
                      'Summary',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),

                    // Membership Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F7FA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.blue.shade50,
                            child: Icon(
                              formData.isPremium ? Icons.star : Icons.star_border,
                              color: formData.isPremium ? Colors.amber : Colors.blue,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formData.isPremium ? 'Premium Member' : 'Free Member',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                formData.isPremium ? '500 LKR / Month' : '0 LKR\nLife time',
                                style: const TextStyle(fontSize: 14, color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // User Details
                    _infoRow('Name', '${formData.title} ${formData.firstName} ${formData.lastName}'),
                    const Divider(height: 32),
                    _infoRow('NIC Number', formData.nicOrPassportNumber),
                    const Divider(height: 32),
                    _infoRow('Mobile Number', formData.mobile),
                    const Divider(height: 32),
                    _infoRow('Email', formData.email),
                    const SizedBox(height: 32),

                    // Terms & Conditions
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: null,
                          activeColor: const Color(0xFF0000CC),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(fontSize: 14, color: Colors.black87),
                              children: [
                                const TextSpan(text: 'Click here to agree '),
                                TextSpan(
                                  text: 'eChanneling Terms and Conditions',
                                  style: const TextStyle(color: Color(0xFF0000CC)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Opening Terms & Conditions...')),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
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
                        // Navigate to Success Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SignUpPage6(isPremium: formData.isPremium),
                          ),
                        );
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

  Widget _stepCheck() {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF0000CC)),
      child: const Icon(Icons.check, color: Colors.white, size: 20),
    );
  }

  Widget _stepLine() {
    return Container(width: 30, height: 2, color: Colors.grey.shade300);
  }

  Widget _infoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }
}