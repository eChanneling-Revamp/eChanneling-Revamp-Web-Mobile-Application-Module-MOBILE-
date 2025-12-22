// lib/screen/advance_search/advance_search_page.dart
import 'package:flutter/material.dart';

class AdvanceSearchPage extends StatefulWidget {
  const AdvanceSearchPage({Key? key}) : super(key: key);

  @override
  State<AdvanceSearchPage> createState() => _AdvanceSearchPageState();
}

class _AdvanceSearchPageState extends State<AdvanceSearchPage> {
  int _selectedIndex = 0;
  String selectedHospitalType = 'Private';
  String selectedGender = 'Any';
  String selectedSessionTime = 'Any';
  String? selectedPriceRange;

  final List<String> priceRanges = [
    'Under Rs. 1000',
    'Rs. 1000 - Rs. 2000',
    'Rs. 2000 - Rs. 5000',
    'Above Rs. 5000'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0000CC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Advance Search',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0000CC), Color(0xFF00C853)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info Text
              Text(
                'Please ensure to provide hospital, specialization or doctor along with other search criteria!',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),

              // Select Hospital Type
              const Text(
                'Select Hospital Type',
                style: TextStyle(
                  color: Color(0xFF0000CC),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildToggleButton('Private', selectedHospitalType == 'Private', () {
                    setState(() => selectedHospitalType = 'Private');
                  }),
                  const SizedBox(width: 8),
                  _buildToggleButton('Ayurvedic', selectedHospitalType == 'Ayurvedic', () {
                    setState(() => selectedHospitalType = 'Ayurvedic');
                  }),
                  const SizedBox(width: 8),
                  _buildToggleButton('Public', selectedHospitalType == 'Public', () {
                    setState(() => selectedHospitalType = 'Public');
                  }),
                ],
              ),
              const SizedBox(height: 24),

              // Select Location
              const Text(
                'Select Location',
                style: TextStyle(
                  color: Color(0xFF0000CC),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildSearchFieldWithIcon('Any', Icons.location_on),
              const SizedBox(height: 24),

              // Select Hospital Name
              const Text(
                'Select Hospital Name',
                style: TextStyle(
                  color: Color(0xFF0000CC),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildSearchField('Any'),
              const SizedBox(height: 24),

              // Select Specialization
              const Text(
                'Select Specialization',
                style: TextStyle(
                  color: Color(0xFF0000CC),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildSearchField('Any'),
              const SizedBox(height: 24),

              // Select Gender
              const Text(
                'Select Gender',
                style: TextStyle(
                  color: Color(0xFF0000CC),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildToggleButton('Any', selectedGender == 'Any', () {
                    setState(() => selectedGender = 'Any');
                  }),
                  const SizedBox(width: 8),
                  _buildToggleButton('Male', selectedGender == 'Male', () {
                    setState(() => selectedGender = 'Male');
                  }),
                  const SizedBox(width: 8),
                  _buildToggleButton('Female', selectedGender == 'Female', () {
                    setState(() => selectedGender = 'Female');
                  }),
                ],
              ),
              const SizedBox(height: 24),

              // Set Price Range
              const Text(
                'Set Price Range',
                style: TextStyle(
                  color: Color(0xFF0000CC),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildDropdown(),
              const SizedBox(height: 24),

              // Select Session Time
              const Text(
                'Select Session Time',
                style: TextStyle(
                  color: Color(0xFF0000CC),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildToggleButton('Any', selectedSessionTime == 'Any', () {
                    setState(() => selectedSessionTime = 'Any');
                  }),
                  const SizedBox(width: 8),
                  _buildToggleButton('Morning', selectedSessionTime == 'Morning', () {
                    setState(() => selectedSessionTime = 'Morning');
                  }),
                  const SizedBox(width: 8),
                  _buildToggleButton('Evening', selectedSessionTime == 'Evening', () {
                    setState(() => selectedSessionTime = 'Evening');
                  }),
                ],
              ),
              const SizedBox(height: 24),

              // Select Date
              const Text(
                'Select Date',
                style: TextStyle(
                  color: Color(0xFF0000CC),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildSearchFieldWithIcon('Any', Icons.calendar_today),
              const SizedBox(height: 24),

              // Select Doctor Name
              const Text(
                'Select Doctor Name',
                style: TextStyle(
                  color: Color(0xFF0000CC),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _buildSearchField('Any'),
              const SizedBox(height: 32),

              // Search Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Perform advanced search
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0000CC),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0000CC),
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white, size: 32),
        elevation: 2,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.home, 'Home', 0),
              _navItem(Icons.receipt_long, 'Bookings', 1),
              const SizedBox(width: 40), // FAB space
              _navItem(Icons.calendar_today, 'Appointments', 3),
              _navItem(Icons.person_outline, 'Profile', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0000CC) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? const Color(0xFF0000CC) : Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontSize: 15,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField(String hint) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 22),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildSearchFieldWithIcon(String hint, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 22),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 4),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF0000CC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
      child: DropdownButtonFormField<String>(
        value: selectedPriceRange,
        hint: Text(
          'Select an item',
          style: TextStyle(color: Colors.grey.shade400, fontSize: 15),
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        items: priceRanges
            .map((e) => DropdownMenuItem(
          value: e,
          child: Text(e, style: const TextStyle(fontSize: 15)),
        ))
            .toList(),
        onChanged: (val) => setState(() => selectedPriceRange = val),
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
        isExpanded: true,
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = index);
        if (index == 0) {
          // Navigate to home page when home icon is clicked
          Navigator.pop(context);
        }
      },
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