import 'package:flutter/material.dart';
import 'signup/sign_up_page_1.dart';
import 'forgot password/forget_password_page.dart';
import 'home/home_page.dart';
import 'package:email_validator/email_validator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _memberIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberInfo = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _memberIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // void _handleSignIn() {
  //   String memberId = _memberIdController.text.trim();
  //   String password = _passwordController.text;
  //
  //   // Basic validation
  //   if (memberId.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please enter your Member ID/Email/NIC')),
  //     );
  //     return;
  //   }
  //
  //   if (password.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please enter your password')),
  //     );
  //     return;
  //   }
  //
  //   // TODO: Add your authentication logic here
  //   // For now, we'll navigate to home page with dummy data
  //
  //   // Navigate to Home Page
  //   Navigator.pushReplacementNamed(
  //     context,
  //     '/home',
  //     arguments: {
  //       'userName': 'Yasindu', // You can get this from authentication
  //       'isPremium': false, // You can get this from user data
  //     },
  //   );
  // }

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
              // constraints: const BoxConstraints(maxWidth:500),
              // margin: const EdgeInsets.only(top:24),
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
              child: Form(
                key:_formkey,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image (if available, otherwise logo)
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
                    // const SizedBox(height: 24),

                    // Sign In Title
                    Padding(
                      padding: const EdgeInsets.only(bottom:0),
                      child: SizedBox(
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),

                    // const SizedBox(height: 16),

                    // Instruction Text
                    Padding(
                      padding: const EdgeInsets.only(bottom:15),
                      child: SizedBox(
                        child: Text(
                          '* Please enter your registered email in below field.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    // const SizedBox(height: 32),

                    // Email Input
                    SizedBox(
                      // color:Colors.blue,
                      height:MediaQuery.of(context).size.height * 0.075,
                      child: TextFormField(
                        controller: _memberIdController,
                        validator:(value){
                          if(value == null || value.isEmpty){
                            return "* Required";
                          }else if(!EmailValidator.validate(value)){
                            return "* Enter valid email";
                          }
                          return null;
                        },
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
                          // contentPadding: const EdgeInsets.symmetric(
                          //   horizontal: 16,
                          //   vertical: 12,
                          // ),
                        ),
                      ),
                    ),

                    // const SizedBox(height: 16),

                    // Password Input
                    SizedBox(
                      // color:Colors.blue,
                      height:MediaQuery.of(context).size.height * 0.075,
                      child: TextFormField(
                        controller: _passwordController,
                        validator:(value){
                          if(value == null || value.isEmpty){
                            return "* Required";
                          }
                          return null;
                        },
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
                          // contentPadding: const EdgeInsets.symmetric(
                          //   horizontal: 16,
                          //   vertical: 12,
                          // ),
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

                    // const SizedBox(height: 16),

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
                        // const SizedBox(width: 8),
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

                    // const SizedBox(height: 24),

                    // Sign In Button with Gradient
                    Padding(
                      padding: const EdgeInsets.only(top:50),
                      child: Container(
                        height:MediaQuery.of(context).size.height * 0.06,
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
                            if(_formkey.currentState!.validate()){
                              await Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>HomePage(userName: 'saythu', isPremium: true)));
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     content:Text("Success"),
                              //     behavior:SnackBarBehavior.floating,
                              //     duration:Duration(seconds:2),
                              //     backgroundColor:Colors.green,
                              //     elevation:10,
                              //     showCloseIcon:true,
                              //   )
                              // );
                              // dispose();
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
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // const SizedBox(height: 16),

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

                    // const SizedBox(height: 16),

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
                                Navigator.push(context,MaterialPageRoute(builder:(context)=>ForgetPasswordPage()));
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

                    // SizedBox(
                    //   child: RichText(
                    //     text: TextSpan(
                    //       style: const TextStyle(
                    //         color: Colors.black87,
                    //         fontSize: 12,
                    //       ),
                    //       children: [
                    //         const TextSpan(text: 'I\'m a new user, '),
                    //         WidgetSpan(
                    //           child:TextButton(
                    //             onPressed:(){
                    //
                    //             },
                    //             child:Text("Sign Up")
                    //           )
                    //         ),
                    //         WidgetSpan(
                    //           child: GestureDetector(
                    //             onTap: () {
                    //               Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                   builder: (context) => const SignUpPage(),
                    //                 ),
                    //               );
                    //             },
                    //             child: const Text(
                    //               'Sign Up',
                    //               style: TextStyle(
                    //                 color: Color(0xFF3B82F6),
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w600,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    // const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
