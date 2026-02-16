import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onSearchDoctorTapped;

  const HomePage({
    Key?key,
    required this.onSearchDoctorTapped
  }):super(key:key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String usr = "Hi User";

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _currentPage = 0;
  final PageController _pageController = PageController();


  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List <Widget> _pages = [
      _Welcome(),
      _buildHeroSection(),
      // _buildMembershipSection()
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height:MediaQuery.of(context).size.height * 0.4,
              child:PageView.builder(
                controller:PageController(),
                onPageChanged:(index){
                  setState((){
                    _currentPage = index;
                  });
                },
                itemCount:_pages.length,
                itemBuilder:(BuildContext,index){
                  return _pages[index];
                }
              )
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical:5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                      (index) => GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? Colors.blue : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Featured Services
            _buildFeaturedServices(),

            // QuicAccess
            _quickAccess(),

          ],
        ),
      ),
    );
  }

  Widget _Welcome() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        height:double.infinity,
        width: double.infinity,
        decoration:BoxDecoration(
          border:.all(
            color:Colors.black.withOpacity(0.1)
          ),
          borderRadius:BorderRadius.all(
            Radius.circular(20)
          ),
          image:DecorationImage(
            image:AssetImage("assets/images/welcome_banner.png"),
            fit:BoxFit.cover
          )
        ),
        child:Column(
          mainAxisAlignment:.start,
          crossAxisAlignment:.start,
          children:[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Welcome to \nE-Channeling",
                style:TextStyle(
                  color:Colors.blue.shade800,
                  fontSize:32,
                  fontWeight:.bold,
                  height:1.4
                ),
                textAlign:.left
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10),
              child: Text("Sri Lanka’s trusted digital healthcare platform. We make it easy to connect with doctors, manage appointments, and access essential healthcare services anytime, anywhere.",
                style:TextStyle(
                  color:Colors.black,
                  fontSize:10,
                  fontWeight:.w400
                ),
                textAlign:.left
              ),
            )
          ]
        )
      ),
    );
  }

  Widget _buildHeroSection() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal:10,vertical:5),
        height:double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Colors.transparent,
          image:DecorationImage(
            image:AssetImage("assets/images/bg_img.png"),
            fit:BoxFit.cover
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Your Health, Our Priority',
              style: TextStyle(
                color: Colors.white,
                fontSize:25,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height:MediaQuery.of(context).size.height * 0.01),
            const Text(
              'Find and book appointments with top doctors near you',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height:MediaQuery.of(context).size.height * 0.03),
            Container(
              padding: const EdgeInsets.symmetric(horizontal:20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  const Text(
                    'Find Doctors Here',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height * 0.005),
                  const Text(
                    'Search top specialists by location and book instantly.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height * 0.025),
                  Container(
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.all(
                        Radius.circular(30)
                      ),
                      gradient:LinearGradient(
                        colors:[
                          Colors.green,
                          Colors.green
                        ],
                        begin:Alignment.topLeft,
                        end:Alignment.bottomRight
                      )
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onSearchDoctorTapped();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal:40, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation:0,
                      ),
                      child: const Row(
                        mainAxisAlignment:.center,
                        children: [
                          Text(
                            'Search Doctors',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width:5),
                          Icon(Icons.arrow_forward, size:20),
                        ],
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

  Widget _buildFeaturedServices() {
    return Container(
      color:Colors.white,
      width:double.infinity,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Featured Services',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height:MediaQuery.of(context).size.height * 0.02),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _serviceCard(
                Icons.video_call,
                'Doctor Channeling',
                'Book doctor appointments easily by selecting your preferred hospital and time.',
                const Color(0xFF10B981),
              ),
              _serviceCard(
                Icons.people_alt_outlined,
                'Member Registration',
                'Create an account to access faster bookings and exclusive member benefits.',
                const Color(0xFF3B82F6),
              ),
              _serviceCard(
                Icons.local_pharmacy,
                'Medical Checkups & Reservations',
                'Schedule medical checkups and reserve healthcare services with ease.',
                const Color(0xFF10B981),
              ),
              _serviceCard(
                Icons.insert_drive_file,
                'Health Records',
                'Store and access your health records securely',
                const Color(0xFF3B82F6),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(
      IconData icon, String title, String description, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius:10,
            offset: const Offset(0,2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: iconColor),
          SizedBox(height:MediaQuery.of(context).size.height * 0.005),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height:MediaQuery.of(context).size.height * 0.005),
          Text(
            description,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
              height:1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembershipSection() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        height:double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF0000CC), Color(0xFF00C853)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWideScreen = constraints.maxWidth > 600;

            if (isWideScreen) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildMembershipContent(),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/doctor_male.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  ..._buildMembershipContent(),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/doctor_male.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  List<Widget> _buildMembershipContent() {
    return [
      const Text(
        'Get Premium Membership',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'Enjoy priority booking, discounts and more benefits',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 20),
      _membershipBenefit('Priority appointment booking'),
      _membershipBenefit('Discounts on consultations'),
      _membershipBenefit('24/7 doctor support'),
      _membershipBenefit('Free health checkups'),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF0000CC),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Learn More',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ];
  }

  Widget _membershipBenefit(String benefit) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 12,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            benefit,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _quickAccess(){
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      child:Column(
        mainAxisAlignment:.start,
        children:[
          Row(
            mainAxisAlignment:.start,
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10),
                child: Text("Quick Access",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              )
            ]
          ),
          CarouselSlider(
            options:CarouselOptions(
              enlargeCenterPage:true,
              enableInfiniteScroll:true,
              autoPlay:false
            ),
            items:[
              _qaCard(
                Icons.person_rounded,
                "Doctor App"
              ),
              _qaCard(
                Icons.newspaper,
                "Running Number"
              ),
              _qaCard(
                Icons.time_to_leave,
                "Booking Doctor"
              ),
              _qaCard(
                Icons.support_agent,
                "Help & Support"
              ),
            ]
          )
        ]
      )
    ),
  );
}

Widget _qaCard(IconData icon,String title){
  return Builder(
    builder: (context) {
      return Container(
        decoration:BoxDecoration(
          color:Colors.blueAccent.withOpacity(0.1),
          borderRadius:.all(Radius.circular(20)),
          border:.all(
            color:Colors.blueAccent.withOpacity(0.1)
          ),
        ),
        width:MediaQuery.of(context).size.width,
        child:Column(
          mainAxisAlignment:.spaceEvenly,
          crossAxisAlignment:.center,
          children:[
            Container(
              decoration:BoxDecoration(
                color:Colors.white,
                borderRadius:.all(Radius.circular(20)),
                border:.all(
                  color:Colors.blueAccent.withOpacity(0.4)
                ),
              ),
              width:MediaQuery.of(context).size.width * 0.25,
              height:MediaQuery.of(context).size.height * 0.15,
              child:Center(
                child:Icon(
                  icon,
                  size:40,
                  color:Colors.grey
                )
              )
            ),
            Text(title,
              style:TextStyle(
                color:Colors.black,
                fontSize:18,
                fontWeight:.bold
              )
            )
          ]
        )
      );
    }
  );
}



