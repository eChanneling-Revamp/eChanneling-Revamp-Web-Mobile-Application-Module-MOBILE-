// lib/screen/find_doctors/find_doctors_page.dart
import 'package:flutter/material.dart';

class FindDoctorsPage extends StatefulWidget {
  const FindDoctorsPage({Key? key}) : super(key: key);

  @override
  State<FindDoctorsPage> createState() => _FindDoctorsPageState();
}

class _FindDoctorsPageState extends State<FindDoctorsPage> {
  int _selectedIndex = 1; // Default to Find Doctors tab

  // Search state
  String searchKeyword = '';
  String selectedSpecialty = '';
  String selectedLocation = '';
  DateTime? selectedDate;

  final List<Map<String, String>> specialties = [
    {'label': 'All Specialties', 'value': ''},
    {'label': 'Cardiology', 'value': 'cardiology'},
    {'label': 'Dermatology', 'value': 'dermatology'},
    {'label': 'Neurology', 'value': 'neurology'},
    {'label': 'Pediatrics', 'value': 'pediatrics'},
  ];

  final List<Map<String, String>> locations = [
    {'label': 'All Locations', 'value': ''},
    {'label': 'Colombo', 'value': 'colombo'},
    {'label': 'Kandy', 'value': 'kandy'},
    {'label': 'Galle', 'value': 'galle'},
    {'label': 'Jaffna', 'value': 'jaffna'},
  ];

  // Mock doctors data
  final List<Map<String, dynamic>> doctors = [
    {
      'id': 1,
      'name': 'Dr. Samantha Perera',
      'specialization': 'Cardiologist',
      'hospital': 'National Hospital, Colombo',
      'rating': 4.9,
      'reviews': 124,
      'experience': '15 years exp.',
      'availability': 'Today',
      'availabilityColor': Colors.green,
      'fee': 3500,
    },
    {
      'id': 2,
      'name': 'Dr. Arjun Rajapakse',
      'specialization': 'Dermatologist',
      'hospital': 'Asiri Hospital, Kandy',
      'rating': 4.7,
      'reviews': 89,
      'experience': '10 years exp.',
      'availability': 'Tomorrow',
      'availabilityColor': Colors.blue,
      'fee': 2800,
    },
    {
      'id': 3,
      'name': 'Dr. Fathima Nizar',
      'specialization': 'Pediatrician',
      'hospital': 'Lady Ridgeway Hospital, Colombo',
      'rating': 4.8,
      'reviews': 156,
      'experience': '12 years exp.',
      'availability': 'Today',
      'availabilityColor': Colors.green,
      'fee': 3200,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Find Doctors',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade50,
            child: Column(
              children: [
                // Search by doctor, specialty or hospital
                TextField(
                  onChanged: (value) => setState(() => searchKeyword = value),
                  decoration: InputDecoration(
                    hintText: 'Search by doctor, specialty or hospital',
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFF0000CC)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                const SizedBox(height: 12),

                // Specialty and Location filters
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedSpecialty.isEmpty ? null : selectedSpecialty,
                        hint: const Text('All Specialties'),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Color(0xFF0000CC)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        items: specialties.map((specialty) {
                          return DropdownMenuItem<String>(
                            value: specialty['value'],
                            child: Text(specialty['label']!),
                          );
                        }).toList(),
                        onChanged: (value) => setState(() => selectedSpecialty = value ?? ''),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedLocation.isEmpty ? null : selectedLocation,
                        hint: const Text('All Locations'),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Color(0xFF0000CC)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        items: locations.map((location) {
                          return DropdownMenuItem<String>(
                            value: location['value'],
                            child: Text(location['label']!),
                          );
                        }).toList(),
                        onChanged: (value) => setState(() => selectedLocation = value ?? ''),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Find button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement search functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0000CC),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Find',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Results section
          Expanded(
            child: doctors.isEmpty
                ? const Center(
                    child: Text('No doctors found'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = doctors[index];
                      return _buildDoctorCard(doctor);
                    },
                  ),
          ),
        ],
      ),

      // Bottom Navigation Bar (matching web app structure)
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
      //           setState(() => _selectedIndex = 1);
      //         }),
      //         _navItem(Icons.calendar_today, 'Appointments', 2, () {
      //           Navigator.pushNamed(context, '/appointments');
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

  Widget _buildDoctorCard(Map<String, dynamic> doctor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Doctor image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/images/doctor_male.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Doctor info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    doctor['specialization'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0000CC),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          doctor['hospital'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Rating and availability
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            '${doctor['rating']} (${doctor['reviews']})',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: doctor['availabilityColor'].withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          doctor['availability'],
                          style: TextStyle(
                            fontSize: 10,
                            color: doctor['availabilityColor'],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Book button
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to booking page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0000CC),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Book',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}
