import 'dart:async';

import 'package:financial_management_app/authentication/login_folder/my_button.dart';
import 'package:financial_management_app/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView({Key? key, this.data}) : super(key: key);

  final Map? data;
  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "OTP VERIFICATION",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "Please enter the OTP code sent to ${widget.data!['phoneNumber']} to verify.",
                style: TextStyle(color: Colors.grey[800], fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              key: formKey,
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                obscureText: true,
                obscuringCharacter: '*',
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 6) {
                    return "Fields not complete";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  inactiveColor: Colors.grey.withOpacity(.3),
                  activeColor: Colors.grey,
                  shape: PinCodeFieldShape.box,
                  selectedColor: Colors.black,
                  selectedBorderWidth: .6,
                  activeBorderWidth: 0.6,
                  errorBorderWidth: 0.6,
                  errorBorderColor: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  fieldOuterPadding: EdgeInsets.zero,
                  fieldHeight: 55,
                  fieldWidth: 50,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                onCompleted: (v) async {
                  debugPrint("Completed");
                  // paymentService.confirmPayment(
                  //     context: context,
                  //     phoneNumber: recievedData['phoneNumber'],
                  //     otpCode: textEditingController.text);
                },
                onChanged: (value) {
                  debugPrint(value);
                  setState(() {
                    // currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  debugPrint("Allowing to paste $text");

                  return true;
                },
              ),
            ),
            const SizedBox(height: 30),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : MyButton(
                    text: "Verify",
                    onPress: () async {
                      setState(() => isLoading = true);
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: widget.data!['verificationId'],
                              smsCode: textEditingController.text);

                      await auth.signInWithCredential(credential).then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavBars()),
                        );
                        setState(() => isLoading = false);
                      });
                    }),

            ////
          ],
        ),
      ),
    );
  }
}
