import 'package:financial_management_app/authentication/login_folder/my_button.dart';
import 'package:financial_management_app/authentication/login_folder/sign_in.dart';
import 'package:financial_management_app/authentication/login_folder/sign_up.dart';
import 'package:flutter/material.dart';

class WellDone extends StatelessWidget {
  const WellDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Container(
                height: 250,
                width: 250,
                child: Image.asset("images/shield.png"),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Well Done!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Welcome to Spend Wise, your new bestfriend to manage your money.",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
              ),
              SizedBox(height: 30,),

              //sign in button
             
               MyButton(text: "Sign In",onPress: (){
                //go to sign up page
                Navigator.push(context, 
                MaterialPageRoute(builder: 
                (context) => Sign_In()));
              } ,),

              SizedBox(height: 15),

               MyButton(text: "Sign Up",onPress: (){
                //go to sign up page
                Navigator.push(context, 
                MaterialPageRoute(builder: 
                (context) => Sign_Up()));
              } ,),
             
            ],
          ),
        ),
      ),
    );
  }
}
