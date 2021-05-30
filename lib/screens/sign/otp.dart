import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:wedsinui/screens/personal_info.dart';
import 'package:wedsinui/widgets/cardButton.dart';

class OTP extends StatefulWidget {
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Color.fromRGBO(161, 32, 108, 1)),
      borderRadius: BorderRadius.circular(20),
    );
  }

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  String otp = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 110, right: 30, left: 30),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your verification code?",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Color.fromRGBO(161, 32, 108, 1), fontSize: 31),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Check your SMS message , we've send you at you the pin at +91" +
                      "9898989898",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color.fromRGBO(161, 32, 108, 1),
                      fontSize: 16,
                      height: 1.5),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10, left: 30, right: 20),
                  //padding: const EdgeInsets.only(left: 30, right: 30),
                  child: PinPut(
                    fieldsCount: 4,
                    eachFieldHeight: 50,
                    eachFieldWidth: 70,

                    focusNode: _pinPutFocusNode,
                    controller: _pinPutController,
                    submittedFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    selectedFieldDecoration: _pinPutDecoration,
                    followingFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // onChanged: (val) {
                    //   setState(() {
                    //     otp = val;
                    //   });
                    // },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Enetre OTP';
                      }
                      if (text.length < 5) {
                        return 'Enter valid mobile number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // _pinPutController.text == null ||
                    //         _pinPutController.text == ""
                    //     ? CardButton()
                    //     :
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonalInfo()));
                      },
                      child: CardButton2(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
