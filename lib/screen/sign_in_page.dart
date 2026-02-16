import 'package:eChanneling/screen/signup/sign_up_page_1.dart';
import 'package:flutter/material.dart';
import 'package:eChanneling/network/api_endpoints.dart';
import 'bottomNavBar.dart';
import 'forgot password/forget_password_page.dart';
import '../network/api_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberInfo = false;
  bool _obscurePassword = true;

  //Check Network Connection
  Future <void> testNetwork() async{
    try{
      final res = await http.get(Uri.parse('https://www.google.com'));
      if(res.statusCode == 200){
        print('Network connection test (Google) : Success');
        print('StatusCode : ${res.statusCode}');
      }
      else{
        print('Network connection test (Google) : Failed');
        print('StatusCode : ${res.statusCode}');
        print('Error : ${res.body}');
      }
    }catch(e){
      print("Error: $e");
    }
  }

  //Login API
  Future <void> SignIn() async{
    showDialog(
      barrierDismissible:false,
      context:context,
      builder:(BuildContext context)=>Center(
        child:CircularProgressIndicator(
          color:Colors.blue
        )
      )
    );
    try{
      //Fetch data from APIs
      final res = await http.post(
        Uri.parse("${ApiConfig.baseUrl}/${ApiEndpoints.signIn}"),
        headers: {'Content-Type': 'application/json'},
        body:json.encode(
          {
            'email' : _emailController.text.trim(),
            'password' : _passwordController.text
          }
        )
      );
      Navigator.of(context).pop();
      if(res.statusCode == 200){
        final data = json.decode(res.body);

        //Store data into shared_preferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('allData',json.encode(data));
        await prefs.setString('userData',json.encode(data['user']));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:Text(data['message']),
            backgroundColor:Colors.green,
            behavior:SnackBarBehavior.floating,
            duration:Duration(seconds:3),
            elevation:10,
            shape:RoundedRectangleBorder(
              borderRadius:BorderRadius.all(
                Radius.circular(20)
              )
            ),
            showCloseIcon:true
          )
        );

        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:(context)=>HomeApp()),
            (route)=>false
        );

        _emailController.clear();
        _passwordController.clear();
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:Text("Error ${res.statusCode}:${res.body}"),
            backgroundColor:Colors.red,
            behavior:SnackBarBehavior.floating,
            duration:Duration(seconds:3),
            elevation:10,
            shape:RoundedRectangleBorder(
              borderRadius:BorderRadius.all(
                Radius.circular(20)
              )
            ),
            showCloseIcon:true
          )
        );
      }
    }catch(error){
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:Text("Error:$error"),
          backgroundColor:Colors.red,
          behavior:SnackBarBehavior.floating,
          duration:Duration(seconds:3),
          elevation:10,
          shape:RoundedRectangleBorder(
            borderRadius:BorderRadius.all(
              Radius.circular(20)
            )
          ),
          showCloseIcon:true
        )
      );
    }
  }

  @override
  void initState(){
    super.initState();
    testNetwork();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF93C5FD), Color(0xFFF9FAFB)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            physics:NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius:10,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal:10),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom:10),
                    child: SizedBox(
                      child: Image.asset('assets/images/signIn.png',
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.2,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // Sign In Title
                  Padding(
                    padding: const EdgeInsets.only(bottom:0),
                    child: SizedBox(
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),

                  // Instruction Text
                  Padding(
                    padding: const EdgeInsets.only(bottom:15),
                    child: SizedBox(
                      child: Text(
                        '* Please enter your registered email in below field.',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  // Email Input
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: SizedBox(
                      height:MediaQuery.of(context).size.height * 0.07,
                      child: TextField(
                        controller: _emailController,
                        cursorColor:Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.black45, width:1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.blue, width:1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.red, width:1),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.red, width:1),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Password Input
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:5),
                    child: SizedBox(
                      height:MediaQuery.of(context).size.height * 0.07,
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        cursorColor:Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 15,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.black45, width:1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.blue, width:1),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                const BorderSide(color: Colors.red, width:1),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.red, width:1),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black45,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Remember Information Checkbox
                  Row(
                    mainAxisAlignment:MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _rememberInfo,
                        onChanged:(value){
                          setState((){
                            _rememberInfo = !_rememberInfo;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        activeColor:Colors.blue,
                      ),
                      TextButton(
                        onPressed:(){
                          setState((){
                            _rememberInfo = !_rememberInfo;
                          });
                        },
                        child:Text('Remember Information',
                          style: TextStyle(
                            fontSize:14,
                            fontWeight:FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      )
                    ],
                  ),

                  // Sign In Button with Gradient
                  Padding(
                    padding: const EdgeInsets.only(top:50),
                    child: Container(
                      height:MediaQuery.of(context).size.height * 0.07,
                      width:MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF3B82F6), Color(0xFF10B981)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed:() async{
                          if(_emailController.text.trim().isEmpty || _emailController.text.trim() == null || _passwordController.text.isEmpty || _passwordController.text == null){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:Text("Email or Password can't be left empty"),
                                backgroundColor:Colors.red,
                                behavior:SnackBarBehavior.floating,
                                duration:Duration(seconds:3),
                                elevation:10,
                                shape:RoundedRectangleBorder(
                                  borderRadius:BorderRadius.all(
                                    Radius.circular(10)
                                  )
                                ),
                                showCloseIcon:true
                              )
                            );
                          }else{
                            SignIn();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child:Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Forget Password Link
                  Padding(
                    padding: const EdgeInsets.only(top:10),
                    child: SizedBox(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPasswordPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: Color(0xFF3B82F6),
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            decorationColor:Color(0xFF3B82F6),
                            decorationThickness:2
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Sign Up Link
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:10),
                    child: SizedBox(
                      child:Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children:[
                          Text('I\'m a new user, ',
                            style:TextStyle(
                              color:Colors.black,
                              fontSize:12,
                              fontWeight:FontWeight.w400
                            )
                          ),
                          TextButton(
                            onPressed:(){
                              Navigator.push(context,MaterialPageRoute(builder:(context)=>SignUpPage()));
                            },
                            child:Text("Sign Up",
                              style:TextStyle(
                                color:Color(0xFF3B82F6),
                                fontSize:14
                              )
                            )
                          )
                        ]
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
