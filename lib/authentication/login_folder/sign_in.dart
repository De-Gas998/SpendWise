import 'package:financial_management_app/authentication/login_folder/my_button.dart';
import 'package:financial_management_app/authentication/login_folder/my_textfield.dart';
import 'package:financial_management_app/authentication/login_folder/sign_up.dart';
import 'package:financial_management_app/authentication/login_folder/square_tile.dart';
import 'package:financial_management_app/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class Sign_In extends StatelessWidget {
   Sign_In({super.key});

  //text editing controllers
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final changePasswordController = TextEditingController();

  //sign user in method
  //void singUserIn(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.green.shade200,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
          //welcome message
          const SizedBox(height: 50,),
      
          const Icon(Icons.lock,
          size: 100,),
      
          const SizedBox(height: 50,),
      
          Text("Welcome to our money saving app, never spend your money before you have it.",
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 18),),
      
            const SizedBox(height: 25,),
          
          //username textfield
          My_TextField(
            controller: phoneController,
            hintText: "Phone",
            obscureText: false,
          ),

          const SizedBox(height: 10,),

          //password textfield
          My_TextField(
            controller: passwordController,
            hintText: "Password",
            obscureText: true,
          ),

          SizedBox(height: 5,),

          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Forgot password?"),
            ],
          ),

          
          const SizedBox(height: 20,),
          
          //Sign Up button
          MyButton(text: "Sign In",onPress: 
          //singUserIn,
          (){
            Navigator.push(context, 
            MaterialPageRoute(builder: 
            (context)=> BottomNavBars()));
          }),

          const SizedBox(height: 35,),

          //or continue with
          Row(
            children: [
              Expanded(
                child: Divider(thickness: 1.5,
                color: Colors.grey[400],),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10),
                child: Text("Or continue with", style: 
                TextStyle(color: Colors.grey[700]),),
              ),

              Expanded(
                child: Divider(thickness: 1.5,
                color: Colors.grey[400],),
              ),
            ],
          ),

          SizedBox(height: 35,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //google button
            Square_Tile(imagePath: "images/google.png",),

            SizedBox(width: 25,),

            //apple button
            Square_Tile(imagePath: "images/apple.png")
          ],),

          const SizedBox(height: 10,),

          //not a member? register now
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member?"),
              GestureDetector(onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: 
                (context) => Sign_Up()));
              },
                child: Text("  Register Now", style: 
                TextStyle(color: Colors.blue),),
              )
            ],
          )
          
          
        ],),
      ),
    ),);
  }
}