import 'package:flutter/material.dart';
import 'package:wedsinui/screens/sign/phoneverify.dart';
import 'package:wedsinui/screens/sign/signIn.dart';
import 'package:wedsinui/widgets/cardButton.dart';
import 'package:wedsinui/widgets/textFromField.dart';

class SignUp extends StatefulWidget {
  static const String routename = '/sign-up';

  SignUp(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userphone,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool isSignin = true;

  toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  toggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  var _isLogin = true;
  String _userEmail = '';
  String _userPhone = '';
  String _pass = '';
  String _cnfpass = '';
  final _formKey = GlobalKey<FormState>();

  bool check = false;

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _cnfpassword = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    void _trySubmit() {
      final isValid = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();

      if (isValid) {
        _formKey.currentState!.save();
        widget.submitFn(
          _userEmail.trim(),
          _pass.trim(),
          _userPhone.trim(),
          _isLogin,
          context,
        );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => PhoneVerify(),
        //   ),
        // );
      }
    }

    return isSignin
        ? Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 110, right: 30, left: 30),
              children: [
                Column(
                  children: [
                    Text(
                      "Continue to your Account",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Color.fromRGBO(161, 32, 108, 1), fontSize: 32),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "New ?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Color.fromRGBO(161, 32, 108, 1)),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isSignin = !isSignin;
                            });
                          },
                          child: Text(
                            "Register",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: Color.fromRGBO(161, 32, 108, 1)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Card(
                      elevation: 3,
                      shadowColor: Color.fromRGBO(161, 32, 108, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _email,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 14,
                                  color: Color.fromRGBO(161, 32, 108, 1)),
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              suffixIcon: Icon(
                                Icons.mail,
                                color: Colors.pink[200],
                              ),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 14,
                                      color: Color.fromRGBO(161, 32, 108, 1)),
                              contentPadding:
                                  EdgeInsets.only(left: 15, top: 15)),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Email can\'t be empty';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _userEmail = value.toString();
                          },
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      shadowColor: Color.fromRGBO(161, 32, 108, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _password,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 14,
                                  color: Color.fromRGBO(161, 32, 108, 1)),
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              suffixIcon: InkWell(
                                onTap: () {
                                  toggle();
                                },
                                child: !_obscureText
                                    ? Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.pink[200],
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: Colors.pink[200],
                                      ),
                              ),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 14,
                                      color: Color.fromRGBO(161, 32, 108, 1)),
                              contentPadding:
                                  EdgeInsets.only(left: 15, top: 15)),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Password  is empty';
                            }
                            if (text.length < 3) {
                              return 'Enter valid Password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _pass = value.toString();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: _trySubmit,
                              child: CardButton2(),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              "Need Help?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: Color.fromRGBO(161, 32, 108, 1),
                                      fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ],
            ),
          )
        : Form(
            key: _formKey,
            child: InkWell(
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
                        "Create an \nAccount",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Color.fromRGBO(161, 32, 108, 1),
                            fontSize: 32),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Already a Member ? ",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Color.fromRGBO(161, 32, 108, 1),
                                    ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isSignin = !isSignin;
                              });
                            },
                            child: Text(
                              "Log In",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: Color.fromRGBO(161, 32, 108, 1),
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Card(
                        elevation: 3,
                        shadowColor: Color.fromRGBO(161, 32, 108, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _email,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 14,
                                    color: Color.fromRGBO(161, 32, 108, 1)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                suffixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.pink[200],
                                ),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 14,
                                        color: Color.fromRGBO(161, 32, 108, 1)),
                                contentPadding:
                                    EdgeInsets.only(left: 15, top: 15)),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Email can\'t be empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _userEmail = value.toString();
                            },
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        shadowColor: Color.fromRGBO(161, 32, 108, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _phone,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 14,
                                    color: Color.fromRGBO(161, 32, 108, 1)),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "+91 1111111111",
                                suffixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.pink[200],
                                ),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 14,
                                        color: Color.fromRGBO(161, 32, 108, 1)),
                                contentPadding:
                                    EdgeInsets.only(left: 15, top: 15)),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'phone number can\'t be empty';
                              }
                              if (text.length > 14) {
                                return 'Phone number should be containing phone code and then number';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _userPhone = value.toString();
                            },
                          ),
                        ),
                      ),
                      // CustometextField(
                      //   paddind: EdgeInsets.only(left: 10, top: 13),
                      //   txt: "91+ Phone",
                      //   ctr: _phone,
                      //   sufIcon: Icons.phone_outlined,
                      //   keytype: TextInputType.name,
                      //   callback: (text) {
                      //     if (text == null || text.isEmpty) {
                      //       return "Phone  is empty";
                      //     }
                      //     if (text.length < 3) {
                      //       return "Enter valid data";
                      //     }
                      //     return null;
                      //   },
                      // ),
                      Card(
                        elevation: 3,
                        shadowColor: Color.fromRGBO(161, 32, 108, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _password,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 14,
                                      color: Color.fromRGBO(161, 32, 108, 1),
                                    ),
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                suffixIcon: InkWell(
                                  onTap: () {
                                    toggle();
                                  },
                                  child: !_obscureText
                                      ? Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Colors.pink[200],
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          color: Colors.pink[200],
                                        ),
                                ),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 14,
                                      color: Color.fromRGBO(161, 32, 108, 1),
                                    ),
                                contentPadding:
                                    EdgeInsets.only(left: 15, top: 15)),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Password  is empty';
                              }
                              if (text.length < 3) {
                                return 'Enter valid Password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _pass = value.toString();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 3,
                        shadowColor: Color.fromRGBO(161, 32, 108, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _cnfpassword,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 14,
                                      color: Color.fromRGBO(161, 32, 108, 1),
                                    ),
                            obscureText: _obscureText2,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                suffixIcon: InkWell(
                                  onTap: () {
                                    toggle2();
                                  },
                                  child: !_obscureText2
                                      ? Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Colors.pink[200],
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          color: Colors.pink[200],
                                        ),
                                ),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 14,
                                      color: Color.fromRGBO(161, 32, 108, 1),
                                    ),
                                contentPadding:
                                    EdgeInsets.only(left: 15, top: 15)),
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Password  is empty';
                              }
                              if (text.length < 3) {
                                return 'Enter valid Password';
                              }
                              if (_password.text != _cnfpassword.text) {
                                return 'Password and confirm password didn\'t match';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _cnfpass = value.toString();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: _trySubmit,
                            child: CardButton2(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                check = !check;
                              });
                            },
                            child: Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: Color.fromRGBO(161, 32, 108, 1),
                                  )),
                              child: check
                                  ? Icon(
                                      Icons.check,
                                      size: 17,
                                      color: Color.fromRGBO(161, 32, 108, 1),
                                    )
                                  : SizedBox(),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "i have read and agree to Terms & Condition of Company",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: Color.fromRGBO(161, 32, 108, 1),
                                      fontSize: 12),
                            ),
                          ),
                          Text(
                            "Need Help?",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Color.fromRGBO(161, 32, 108, 1),
                                    fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
