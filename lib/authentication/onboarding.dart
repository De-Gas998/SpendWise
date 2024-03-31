import 'package:financial_management_app/authentication/well_done.dart';
import 'package:financial_management_app/authentication/intro_page1.dart';
import 'package:financial_management_app/authentication/intro_page2.dart';
import 'package:financial_management_app/authentication/intro_page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  //controller to keep track of which page we're on
  PageController _controller = PageController();

  //keep track of if we are on the last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(
      children: [
        //page view
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
      children: [
        IntroPage1(),
        IntroPage2(),
        IntroPage3()
      ],
    ),

    //dot indicators
    Container(
      alignment: Alignment(0, 0.75),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          //skip
          GestureDetector(
            onTap: () {
              _controller.jumpToPage(2);
            },
            child: Text('skip')),

          //dot indicator
          SmoothPageIndicator(controller: _controller, count: 3),

          //next or done
          onLastPage ?
          GestureDetector(
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return WellDone();
               },),);
             },
            child: Text('done')) 
            : GestureDetector(
             onTap: () {
              _controller.nextPage(duration: Duration(milliseconds: 500), 
              curve: Curves.easeIn);
            },
            child: Text('next'))
        ],
      ))
      ],
    ));
  }
}