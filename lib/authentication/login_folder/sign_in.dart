import 'package:financial_management_app/authentication/login_folder/my_button.dart';
import 'package:financial_management_app/authentication/login_folder/my_textfield.dart';
import 'package:financial_management_app/authentication/login_folder/sign_up.dart';
import 'package:financial_management_app/authentication/login_folder/square_tile.dart';
import 'package:financial_management_app/authentication/login_folder/verify_otp.dart';
import 'package:financial_management_app/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Sign_In extends StatefulWidget {
  Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  //text editing controllers
  final phoneController = TextEditingController();
  bool startLoarding = false;
  //sign user in method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //welcome message
                const SizedBox(
                  height: 50,
                ),

                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(
                  height: 50,
                ),

                Text(
                  "Welcome to our money saving app, never spend your money before you have it.",
                  style: TextStyle(color: Colors.grey[800], fontSize: 18),
                ),

                const SizedBox(
                  height: 25,
                ),

                //username textfield
                My_TextField(
                  controller: phoneController,
                  hintText: "Phone",
                  obscureText: false,
                ),

                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 5,
                ),

                const SizedBox(
                  height: 20,
                ),

                //Sign Up button
                startLoarding
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : MyButton(
                        text: "Sign In",
                        onPress:
                            //singUserIn,
                            () async {
                          setState(() => startLoarding = true);
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '+233${phoneController.text}',
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {
                              setState(() => startLoarding = false);
                              print(e.toString());
                            },
                            codeSent:
                                (String verificationId, int? resendToken) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VerifyOtpView(
                                            data: {
                                              "verificationId": verificationId,
                                              "phoneNumber":
                                                  phoneController.text
                                            },
                                          )
                                      // BottomNavBars()

                                      ));
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                        }),

                const SizedBox(
                  height: 35,
                ),

                //or continue with
                // Row(
                //   children: [
                //     Expanded(
                //       child: Divider(
                //         thickness: 1.5,
                //         color: Colors.grey[400],
                //       ),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 10),
                //       child: Text(
                //         "Or continue with",
                //         style: TextStyle(color: Colors.grey[700]),
                //       ),
                //     ),
                //     Expanded(
                //       child: Divider(
                //         thickness: 1.5,
                //         color: Colors.grey[400],
                //       ),
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: 35,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     //google button
                //     Square_Tile(
                //       imagePath: "images/google.png",
                //     ),

                //     SizedBox(
                //       width: 25,
                //     ),

                //     //apple button
                //     Square_Tile(imagePath: "images/apple.png")
                //   ],
                // ),

                // const SizedBox(
                //   height: 10,
                // ),

                // //not a member? register now
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("Not a member?"),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) => Sign_Up()));
                //       },
                //       child: Text(
                //         "  Register Now",
                //         style: TextStyle(color: Colors.blue),
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
