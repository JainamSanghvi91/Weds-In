import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:wedsinui/screens/sign/otp.dart';
import 'package:wedsinui/widgets/button.dart';

class PhoneVerify extends StatefulWidget {
  @override
  _PhoneVerifyState createState() => _PhoneVerifyState();
}

class _PhoneVerifyState extends State<PhoneVerify> {
  TextEditingController _phoneControlller = TextEditingController();
  String countryCode = "+91";
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
                  "What is your \nphone number?",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Color.fromRGBO(161, 32, 108, 1), fontSize: 32),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "We need your phone number to send you a verification code.",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Color.fromRGBO(161, 32, 108, 1), fontSize: 14),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: SizedBox(
                          width: 100,
                          child: CountryCodePicker(
                            onChanged: (e) {
                              print(e.toLongString());
                              print(e.name);
                              print(e.code);
                              print(e.dialCode);
                              setState(() {
                                countryCode = e.dialCode;
                              });
                            },
                            initialSelection: 'भारत',
                            showFlagMain: true,
                            showFlag: true,
                            favorite: ['+91', 'भारत'],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 3,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: TextFormField(
                            controller: _phoneControlller,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 14, right: 14, bottom: 5),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 16),
                              hintText: "Mobile number",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OTP()));
                  },
                  child: CustomeButton(txt: "Continue"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
