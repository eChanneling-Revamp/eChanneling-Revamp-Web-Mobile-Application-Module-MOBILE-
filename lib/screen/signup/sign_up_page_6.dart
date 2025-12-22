// lib/screen/signup/sign_up_page_6.dart
import 'package:flutter/material.dart';

class SignUpPage6 extends StatelessWidget {
  final bool isPremium;

  const SignUpPage6({Key? key, required this.isPremium}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
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
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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

                    // Step Indicator - All 5 steps completed
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
                    const SizedBox(height: 80),

                    // Success Icon
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(Icons.check, color: Colors.white, size: 48),
                    ),
                    const SizedBox(height: 32),

                    // Success Message
                    Text(
                      'Congratulations! You have\nsuccessfully registered as a\n${isPremium ? "Premium" : "Free"} Member!',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                    ),
                    const Spacer(),
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
                        // In SignUpPage6 Done button
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                              (route) => false,
                          arguments: {
                            'userName': 'Yasindu',
                            'isPremium': true,
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0000CC),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        fixedSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Done', style: TextStyle(fontSize: 16, color: Colors.white)),
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
}