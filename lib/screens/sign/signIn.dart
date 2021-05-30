// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:wedsinui/screens/sign/phoneverify.dart';
// import 'package:wedsinui/screens/sign/signUp.dart';
// import 'package:wedsinui/widgets/cardButton.dart';
// import 'package:wedsinui/widgets/textFromField.dart';

// class SignIn extends StatefulWidget {
//   static const String routename = '/sign-in';
//   @override
//   _SignInState createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   TextEditingController _email = new TextEditingController();
//   TextEditingController _password = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: InkWell(
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: ListView(
//           shrinkWrap: true,
//           padding: const EdgeInsets.only(top: 110, right: 30, left: 30),
//           children: [
//             Column(
//               children: [
//                 Text(
//                   "Continue to your Account",
//                   style: Theme.of(context).textTheme.bodyText2!.copyWith(
//                       color: Color.fromRGBO(161, 32, 108, 1), fontSize: 32),
//                   textAlign: TextAlign.left,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       "New ?",
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyText1!
//                           .copyWith(color: Color.fromRGBO(161, 32, 108, 1)),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => SignUp()));
//                       },
//                       child: Text(
//                         "Register",
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyText2!
//                             .copyWith(color: Color.fromRGBO(161, 32, 108, 1)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 CustometextField(
//                   paddind: EdgeInsets.only(left: 10, top: 13),
//                   txt: "Email",
//                   ctr: _email,
//                   sufIcon: Icons.mail,
//                   keytype: TextInputType.name,
//                   callback: (text) {
//                     if (text == null || text.isEmpty) {
//                       return 'Phone or email is empty';
//                     }
//                     if (text.length < 3) {
//                       return 'Enter valid data';
//                     }
//                     return null;
//                   },
//                 ),
//                 Card(
//                   elevation: 3,
//                   shadowColor: Color.fromRGBO(161, 32, 108, 1),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30)),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: TextFormField(
//                       keyboardType: TextInputType.visiblePassword,
//                       controller: _password,
//                       style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                           fontSize: 14, color: Color.fromRGBO(161, 32, 108, 1)),
//                       obscureText: _obscureText,
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Password",
//                           suffixIcon: InkWell(
//                             onTap: () {
//                               toggle();
//                             },
//                             child: !_obscureText
//                                 ? Icon(
//                                     Icons.remove_red_eye_outlined,
//                                     color: Colors.pink[200],
//                                   )
//                                 : Icon(
//                                     Icons.visibility_off,
//                                     color: Colors.pink[200],
//                                   ),
//                           ),
//                           hintStyle: Theme.of(context)
//                               .textTheme
//                               .bodyText1!
//                               .copyWith(
//                                   fontSize: 14,
//                                   color: Color.fromRGBO(161, 32, 108, 1)),
//                           contentPadding: EdgeInsets.only(left: 15, top: 15)),
//                       validator: (text) {
//                         if (text == null || text.isEmpty) {
//                           return 'Password  is empty';
//                         }
//                         if (text.length < 3) {
//                           return 'Enter valid Password';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 70,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Column(
//                       children: [
//                         // _email.text == null ||
//                         //         _email.text == "" && _password.text == null ||
//                         //         _password.text == ""
//                         //     ? CardButton()
//                         //     :
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => PhoneVerify()));
//                           },
//                           child: CardButton2(),
//                         ),
//                         SizedBox(
//                           height: 9,
//                         ),
//                         Text(
//                           "Need Help?",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyText1!
//                               .copyWith(
//                                   color: Color.fromRGBO(161, 32, 108, 1),
//                                   fontSize: 16),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 70,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
