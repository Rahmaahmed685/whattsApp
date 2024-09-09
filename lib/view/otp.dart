import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/core/colors/colors.dart';
import 'package:notes/view/send_otp.dart';
import '../controller.dart';
import '../widget/app_text.dart';
import 'home_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.phone});
final String phone;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  @override
  void initState() {
    phoneAuth();
    super.initState();
  }
  final phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
 String? verifid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(text: "Verifing your number",fontSize: 25,),
          AppText(text: "we have sent an sms to ${widget.phone}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            TextFieldOtp(controller:c1 ,first:true ,last: false, correct: false,),
              TextFieldOtp(controller:c2 ,first:false ,last: false, correct: false,),
              TextFieldOtp(controller:c3 ,first:false ,last: false, correct: false,),
              TextFieldOtp(controller:c4 ,first:false ,last: false, correct: false,),
              TextFieldOtp(controller:c5 ,first:false ,last: false, correct: false,),
              TextFieldOtp(controller:c6 ,first:false ,last: true, correct: false,),


                  ],),
          SizedBox(height: 300,),
          ElevatedButton(onPressed: () {
            sentCode();
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> HomeScreen()));
          },

              style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor
              ),
              child: AppText(text: "Confirm",color: Colors.white,))
        ],),
    );
  }



void phoneAuth() async{
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: widget.phone,
    timeout: Duration(seconds: 120),
    verificationCompleted: (PhoneAuthCredential credential) {},
    verificationFailed: (FirebaseAuthException e) {},
    codeSent: (String verificationId, int? resendToken) async {
      verifid = verificationId;
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      verifid=verificationId;
    },
  );
}
 void  sentCode () async {
    try{
      String smsCode = c1.text+c2.text+c3.text+c4.text+c5.text+c6.text;
      PhoneAuthCredential credential =
    PhoneAuthProvider.credential(
        verificationId: verifid!, smsCode: smsCode);
      await auth.signInWithCredential(credential).then((Value){
      // if(Value.user != null){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> HomeScreen()));

    });}
    catch(ex){
      print('correct = $ex');
    }
  }
}
