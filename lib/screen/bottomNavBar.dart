import 'package:flutter/material.dart';
import 'package:eChanneling/screen/Appointments/my_appointments_page.dart';
import 'package:eChanneling/screen/find_doctors/find_doctors_page.dart';
import 'package:eChanneling/screen/home/home_page.dart';
import 'package:eChanneling/screen/profile/profile_page.dart';


class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  int SelectedIndex = 0;

  final List pages = [
    HomePage(userName: "Saythu", isPremium: true),
    FindDoctorsPage(),
    MyAppointmentsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //body
      body:SafeArea(
        child:pages[SelectedIndex]
      ),

      //BottomNavigationBar
      bottomNavigationBar:BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        selectedItemColor:Colors.blueAccent,
        unselectedItemColor:Colors.black45,
        currentIndex:SelectedIndex,
        onTap:(index){
          setState((){
            SelectedIndex = index;
            print (SelectedIndex);
          });
        },
        items:[
          BottomNavigationBarItem(
            icon:Icon(
              Icons.home_rounded
            ),
            label:"Home",
            tooltip:"home"
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.search_rounded
            ),
            label:"Find Doctors",
            tooltip:"find doctors"
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.calendar_month_rounded
            ),
            label:"Appointments",
            tooltip:"appointments"
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.person_rounded
            ),
            label:"Profile",
            tooltip:"profile"
          )
        ]
      )
    );
  }
}
