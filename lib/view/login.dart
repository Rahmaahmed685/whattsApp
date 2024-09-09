import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/core/colors/colors.dart';
import 'package:notes/screens/otp.dart';
import 'package:notes/widget/app_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child:
          AppText(
            text: "Enter your phone number",fontSize: 25,)),
        AppText(text: "whatsApp will need to verify your phone number"),
        TextFormField(
          keyboardType: TextInputType.phone,
          controller: phoneController,
          decoration: InputDecoration(
            border : OutlineInputBorder(),
            hintText:"+20 000 000 000",
            constraints: BoxConstraints(maxWidth: 400),
            label: Text("Enter your phone number"),
          ),
        ),
          SizedBox(height: 300,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> OtpScreen(phone: phoneController.text,)));
          },
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor
                  ),
              child: AppText(text: "Next",color: Colors.white,))
      ],),
    );
  }

}
