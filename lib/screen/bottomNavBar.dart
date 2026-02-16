import 'package:flutter/material.dart';
import 'package:eChanneling/screen/Appointments/my_appointments_page.dart';
import 'package:eChanneling/screen/find_doctors/find_doctors_page.dart';
import 'package:eChanneling/screen/home/home_page.dart';
import 'package:eChanneling/screen/profile/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HomeApp extends StatefulWidget {
  HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}


class _HomeAppState extends State<HomeApp> {

  Map<String,dynamic> userData = {};
  int SelectedIndex = 0;

  @override
  void initState(){
    super.initState();
    loadUserData();
  }

  Future <void> loadUserData() async{
    final prefs = await SharedPreferences.getInstance();

    setState((){
      final userDataString = prefs.getString('userData') ?? '{}';
      userData = json.decode(userDataString);
    });

    print(userData['first_name']);
    print(userData['last_name']);
    print(userData['phone_number']);
    print(userData['first_role']);
  }

  void changeIndex(int index){
    setState((){
      SelectedIndex = index;
    });
  }

  late List pages = [
    HomePage(onSearchDoctorTapped:()=>changeIndex(1)),
    FindDoctorsPage(),
    MyAppointmentsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,

      //AppBar
      appBar:AppBar(
        title:Text("User_Name"),
        centerTitle:false,
        actions:[
          IconButton(
            onPressed:(){

            },
            icon:Icon(
              Icons.notifications_none_outlined
            )
          )
        ],
        backgroundColor:Colors.white,
        surfaceTintColor:Colors.transparent,
      ),

      //Drawer
      drawer:Drawer(
        backgroundColor:Colors.white,
        shadowColor:Colors.black45,
        elevation:10,
        child:Padding(
          padding: const EdgeInsets.symmetric(vertical:50,horizontal:20),
          child: ListView(
            children:[
              Text("hi")
            ]
          ),
        )
      ),

      //body
      body:SafeArea(
        child:pages[SelectedIndex],
      ),

      //BottomNavigationBar
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor:Colors.white,
        elevation:10,
        type:BottomNavigationBarType.fixed,
        selectedItemColor:Colors.blueAccent,
        unselectedItemColor:Colors.black45,
        currentIndex:SelectedIndex,
        onTap:(index){
          setState((){
            SelectedIndex = index;
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
