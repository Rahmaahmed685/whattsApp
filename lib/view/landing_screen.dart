import 'package:flutter/material.dart';
import '../core/colors/colors.dart';
import '../widget/app_button.dart';
import '../widget/app_text.dart';
import 'login.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 50,),
          AppText(text: "Welcome to WhatsApp",color: mainColor,fontSize: 25,),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child:Image.asset('assets/images/logo_login.jpg',
              width: double.infinity,
              height: 450,),
          ),
        ),
        Text("Read Our Privacy Policy, Tap \"Agree and continue\" to\n "
            "                  accept the Terms of Service"),
        AppButton(title: "AGREE AND CONTINUE",onTap: (){
          Navigator.of(context).
          push(MaterialPageRoute(builder:
              (context) => LoginScreen()));})

      ],)),
    );
  }
}
