import 'package:flutter/material.dart';

class MyAppointmentsPage extends StatefulWidget {
  const MyAppointmentsPage({Key? key}) : super(key: key);

  @override
  State<MyAppointmentsPage> createState() => _MyAppointmentsPageState();
}

String appointment = "Appointments";

class _MyAppointmentsPageState extends State<MyAppointmentsPage> {
  int _selectedIndex = 2; // Appointments tab is selected
  String _activeTab = 'upcoming'; // 'upcoming', 'past', 'cancelled'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: const Text(
      //     'Appointments',
      //     style: TextStyle(
      //       color: Colors.black87,
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.notifications_outlined, color: Colors.black87),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),

      body: Column(
        children: [
          const SizedBox(height: 16),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Appointments',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Manage your medical appointments',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Tab Buttons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildTabButton('Upcoming', 'upcoming', _getAppointmentCount('upcoming')),
                const SizedBox(width: 8),
                _buildTabButton('Past', 'past', _getAppointmentCount('past')),
                const SizedBox(width: 8),
                _buildTabButton('Cancelled', 'cancelled', _getAppointmentCount('cancelled')),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Appointments List
          Expanded(
            child: _buildAppointmentsList(),
          ),
        ],
      ),

      // Bottom Navigation Bar
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 8,
      //   child: SizedBox(
      //     height: 60,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         _navItem(Icons.home, 'Home', 0, () {
      //           Navigator.pushNamed(context, '/home');
      //         }),
      //         _navItem(Icons.search, 'Find Doctors', 1, () {
      //           Navigator.pushNamed(context, '/find_doctors');
      //         }),
      //         _navItem(Icons.calendar_today, 'Appointments', 2, () {
      //           setState(() => _selectedIndex = 2);
      //         }),
      //         _navItem(Icons.person_outline, 'Profile', 3, () {
      //           Navigator.pushNamed(context, '/profile');
      //         }),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget _buildTabButton(String label, String tabKey, int count) {
    bool isActive = _activeTab == tabKey;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _activeTab = tabKey),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF0000CC) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isActive ? const Color(0xFF0000CC) : Colors.grey.shade300,
            ),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$count',
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey.shade600,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentsList() {
    final appointments = _getFilteredAppointments();

    if (appointments.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'No ${_activeTab} appointments',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You don\'t have any ${_activeTab} appointments at the moment.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return _buildAppointmentCard(
          doctorName: appointment['doctorName']!,
          specialization: appointment['specialization']!,
          date: appointment['date']!,
          time: appointment['time']!,
          location: appointment['location']!,
          status: appointment['status']!,
          canJoin: appointment['canJoin'] ?? false,
          canCancel: appointment['canCancel'] ?? false,
          canReschedule: appointment['canReschedule'] ?? false,
        );
      },
    );
  }

  List<Map<String, dynamic>> _getFilteredAppointments() {
    return _getAllAppointments().where((apt) => apt['status'] == _activeTab).toList();
  }

  int _getAppointmentCount(String status) {
    return _getAllAppointments().where((apt) => apt['status'] == status).length;
  }

  List<Map<String, dynamic>> _getAllAppointments() {
    return [
      {
        'doctorName': 'Dr. Samantha Perera',
        'specialization': 'Cardiologist',
        'date': '6/15/2023',
        'time': '10:00 AM',
        'location': 'National Hospital, Colombo',
        'status': 'upcoming',
        'canJoin': false,
        'canCancel': true,
        'canReschedule': true,
      },
      {
        'doctorName': 'Dr. Arjun Rajapakse',
        'specialization': 'Dermatologist',
        'date': '6/20/2023',
        'time': '2:30 PM',
        'location': 'Asiri Hospital, Kandy',
        'status': 'upcoming',
        'canJoin': true,
        'canCancel': true,
        'canReschedule': true,
      },
      {
        'doctorName': 'Dr. Kamal Silva',
        'specialization': 'General Physician',
        'date': '5/10/2023',
        'time': '11:00 AM',
        'location': 'City Medical Center',
        'status': 'past',
        'canJoin': false,
        'canCancel': false,
        'canReschedule': false,
      },
      {
        'doctorName': 'Dr. Nisha Fernando',
        'specialization': 'Pediatrician',
        'date': '4/22/2023',
        'time': '3:00 PM',
        'location': 'Lady Ridgeway Hospital',
        'status': 'cancelled',
        'canJoin': false,
        'canCancel': false,
        'canReschedule': false,
      },
    ];
  }

  Widget _navItem(IconData icon, String label, int index, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index ? const Color(0xFF0000CC) : Colors.grey.shade600,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? const Color(0xFF0000CC) : Colors.grey.shade600,
              fontSize: 11,
              fontWeight: _selectedIndex == index ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard({
    required String doctorName,
    required String specialization,
    required String date,
    required String time,
    required String location,
    required String status,
    required bool canJoin,
    required bool canCancel,
    required bool canReschedule,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor info row
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/doctor_male.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      specialization,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF0000CC),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: status == 'upcoming' ? Colors.green.shade50 : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status == 'upcoming' ? 'Upcoming' : status == 'past' ? 'Completed' : 'Cancelled',
                  style: TextStyle(
                    fontSize: 12,
                    color: status == 'upcoming' ? Colors.green.shade700 : Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Date and time
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 12),
              Icon(Icons.access_time, size: 16, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Location
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Action buttons
          Row(
            children: [
              if (canJoin)
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle join consultation
                    },
                    icon: const Icon(Icons.videocam, size: 16),
                    label: const Text('Join Consultation'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              if (canJoin) const SizedBox(width: 8),
              if (canReschedule)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle reschedule
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF0000CC)),
                      foregroundColor: const Color(0xFF0000CC),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text('Reschedule'),
                  ),
                ),
              if (canReschedule && canCancel) const SizedBox(width: 8),
              if (canCancel)
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      // Handle cancel
                      if (mounted) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Cancel Appointment'),
                            content: Text('Are you sure you want to cancel your appointment with $doctorName?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Appointment with $doctorName cancelled')),
                                  );
                                },
                                child: const Text('Yes', style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
