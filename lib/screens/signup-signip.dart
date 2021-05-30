import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wedsinui/screens/sign/signUp.dart';

class AuthScreen extends StatefulWidget {
  static const String routename = '/auth-screen';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    AuthResult authResult;
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //upload an image on firestore before we write extra data
        // Here ref points to root bucket where we can store all our data like images
        //   final ref = FirebaseStorage.instance
        //       .ref()
        //       .child('user_image')
        //       .child(authResult.user.uid + '.jpg');

        //   await ref.putFile(image).onComplete;

        //   final url = await ref.getDownloadURL();

        //   //extra user data
        //   await Firestore.instance
        //       .collection('users')
        //       .document(authResult.user.uid)
        //       .setData({
        //     'username': username,
        //     'email': email,
        //     'imageUrl': url,
        //   });
        // }
      }
    } on PlatformException catch (error) {
      var message = 'An error occured, please check your credentials!';

      if (error.message != null) {
        message = error.message.toString();
      }

      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
      ));
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUp(_submitAuthForm, _isLoading),
    );
  }
}
