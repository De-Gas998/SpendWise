import 'package:financial_management_app/authentication/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, 
    );
    Future.delayed(Duration(seconds: 5), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const onboarding()));
    });
  }

  @override
  void dispose(){
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, 
      overlays: SystemUiOverlay.values);
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    Center(child: 
    Container(height: 800, width: 400, color: Colors.white,
      child: 
    Image.asset("images/download.png", fit: BoxFit.contain,)),));
  }
}