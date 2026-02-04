import 'dart:ui';
import 'package:flutter/material.dart';
import 'sign_up_page_2.dart';
import 'sign_up_page_4.dart';

class SignUpPage3 extends StatefulWidget {
  const SignUpPage3({Key? key}) : super(key: key);

  @override
  State<SignUpPage3> createState() => _SignUpPage3State();
}

class _SignUpPage3State extends State<SignUpPage3> {
  bool _showPremium = false;

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (details.delta.dx < -10) {
      setState(() => _showPremium = true);
    } else if (details.delta.dx > 10) {
      setState(() => _showPremium = false);
    }
  }

  /// -------------------  POP-UP WITH BLUR  -------------------
  void _showMembershipDetails(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Blur background
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _benefitRow(
                '30% on ECH Service fee when making an appointment through ECH Call centre (071 0 225 225)',
              ),
              const SizedBox(height: 12),
              _benefitRow(
                '15% on ECH Service fee when making an appointment through EC Web and App.',
              ),
              const SizedBox(height: 12),
              _benefitRow(
                'Able to enjoy the facilities provided by E-Channeling',
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 16),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      // TODO: Navigate to Member Offers page
                    },
                    child: const Text(
                      'Member offers',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _benefitRow('+ Free Member Benefits'),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0000CC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _benefitRow(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle, color: Colors.green, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
      ],
    );
  }
  /// -------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 60),
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
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: Text(
                          'Hello there! Let\'s create your account.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Step indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildStepIndicator(1, true),
                          _buildStepLine(),
                          _buildStepIndicator(2, true),
                          _buildStepLine(),
                          _buildStepIndicator(3, true),
                          _buildStepLine(),
                          _buildStepIndicator(4, false),
                          _buildStepLine(),
                          _buildStepIndicator(5, false),
                        ],
                      ),
                      const SizedBox(height: 32),

                      const Text(
                        'Select Package',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Swipeable cards
                      GestureDetector(
                        onHorizontalDragUpdate: _onHorizontalDragUpdate,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            final offset = _showPremium
                                ? const Offset(1.0, 0.0)
                                : const Offset(-1.0, 0.0);
                            return SlideTransition(
                              position: Tween<Offset>(begin: offset, end: Offset.zero)
                                  .animate(animation),
                              child: child,
                            );
                          },
                          child: _showPremium ? _buildPremiumCard() : _buildFreeCard(),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Info icon
                      Row(
                        children: const [
                          Icon(Icons.info, color: Color(0xFF0000CC), size: 16),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'To view more info regarding eChanneling membership and benefits',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF0000CC),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Membership Details link on its own line
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, top: 4.0),
                        child: InkWell(
                          onTap: () => _showMembershipDetails(context),
                          child: const Text(
                            'Membership Details',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF0000CC),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom navigation buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const SignUpPage2()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black87,
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        fixedSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Previous', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SignUpPage4(isPremium: _showPremium), // Pass the flag
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0000CC),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        fixedSize: const Size.fromHeight(50),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
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

  // Step indicator widgets
  Widget _buildStepIndicator(int step, bool isActive) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color(0xFF0000CC) : Colors.white,
        border: Border.all(
          color: isActive ? const Color(0xFF0000CC) : Colors.grey,
          width: 2,
        ),
      ),
      child: Center(
        child: isActive
            ? const Icon(Icons.check, color: Colors.white, size: 20)
            : Text(
          '$step',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildStepLine() {
    return Container(width: 30, height: 2, color: Colors.grey.shade300);
  }

  // Free Card
  Widget _buildFreeCard() {
    return Card(
      key: const ValueKey('freeCard'),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.blue, size: 24),
                const SizedBox(width: 8),
                const Text(
                  'Free Member',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0000CC),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Selected',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('0 LKR Life time', style: TextStyle(fontSize: 14, color: Colors.black54)),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 16),
                const SizedBox(width: 8),
                const Text('Member loyalty point scheme',
                    style: TextStyle(fontSize: 14, color: Colors.black87)),
              ],
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text('LKR 100 = 1 Point\n1 Point = 1 LKR',
                  style: TextStyle(fontSize: 12, color: Colors.black54)),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 16),
                const SizedBox(width: 8),
                const Text('Able to view Doctor Channel History',
                    style: TextStyle(fontSize: 14, color: Colors.black87)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Premium Card
  Widget _buildPremiumCard() {
    return Card(
      key: const ValueKey('premiumCard'),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 24),
                const SizedBox(width: 8),
                const Text(
                  'Premium Member',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.amber[700],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Selected',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('500 LKR / Month', style: TextStyle(fontSize: 14, color: Colors.black54)),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 16),
                const SizedBox(width: 8),
                const Text('All Free Member benefits',
                    style: TextStyle(fontSize: 14, color: Colors.black87)),
              ],
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text('LKR 100 = 1 Point\n1 Point = 1 LKR',
                  style: TextStyle(fontSize: 12, color: Colors.black54)),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 16),
                const SizedBox(width: 8),
                const Text('Priority booking for Doctor Channels',
                    style: TextStyle(fontSize: 14, color: Colors.black87)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 16),
                const SizedBox(width: 8),
                const Text('Exclusive discounts on services',
                    style: TextStyle(fontSize: 14, color: Colors.black87)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}