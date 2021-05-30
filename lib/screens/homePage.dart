import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:wedsinui/providers/google_provider.dart';
import 'package:wedsinui/screens/personal_info.dart';
import 'package:wedsinui/screens/sign/signIn.dart';
import 'package:wedsinui/screens/sign/signUp.dart';
import 'package:wedsinui/screens/signup-signip.dart';
import 'package:wedsinui/widgets/video_player.dart';
import 'package:wedsinui/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isloading = false;
  late VideoPlayerController _controller;
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      "assets/videos/video.mov",
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSignIn = false;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser _user;
    FacebookLogin facebookLogin = FacebookLogin();

    Future loginWithfacebook(FacebookLoginResult result) async {
      final FacebookAccessToken gettoken = result.accessToken;
      AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: gettoken.token,
      );
      var a = await _auth.signInWithCredential(credential);
      setState(() {
        isSignIn = true;
        _user = a.user;
      });
    }

    Future<void> handleLogin() async {
      final FacebookLoginResult result = await facebookLogin.logIn(
        ['email'],
      );
      switch (result.status) {
        case FacebookLoginStatus.cancelledByUser:
          break;
        case FacebookLoginStatus.error:
          break;
        case FacebookLoginStatus.loggedIn:
          try {
            await loginWithfacebook(result);
          } catch (e) {
            print(e);
          }
          break;
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        print("height is ${constraints.maxHeight}");
        print("width is ${constraints.maxWidth}");
        return Scaffold(
          body: isSignIn
              ? PersonalInfo()
              : Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: _controller.value.isInitialized
                          ? VideoPlayer(
                              _controller,
                            )
                          : Container(),
                    ),
                    Container(
                      color: Colors.pink[100]!.withOpacity(0.7),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 150, right: 20, left: 20, bottom: 20),
                            child: Column(
                              children: [
                                Container(
                                  child: SvgPicture.asset(
                                      "assets/images/title-white.svg"),
                                ),
                                SizedBox(
                                  height: 100,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      _controller.value.isPlaying
                                          ? _controller.pause()
                                          : _controller.play();
                                    });
                                  },
                                  child: Icon(
                                    _controller.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "Sign in",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        color: Theme.of(context).canvasColor,
                                        fontSize: 18,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) => AllowLocation()));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.instagram,
                                                  color: Theme.of(context)
                                                      .canvasColor,
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                ),
                                                Text(
                                                  "Sign in with instagram",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .canvasColor),
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await handleLogin();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                color: Colors.blue, width: 2),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.facebookF,
                                                  color: Theme.of(context)
                                                      .canvasColor,
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                ),
                                                Text(
                                                  "Sign in with facebook",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          color:
                                                              Theme.of(context)
                                                                  .canvasColor),
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _isloading = true;
                                          });
                                          final provider = Provider.of<
                                                  GoogleSingnInProvider>(
                                              context,
                                              listen: false);
                                          provider.login();

                                          setState(() {
                                            _isloading = false;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).canvasColor,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.google,
                                                  color: Theme.of(context)
                                                      .errorColor,
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                ),
                                                Text(
                                                  "Sign with Google",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(),
                                                ),
                                                Expanded(
                                                  child: SizedBox(),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                            AuthScreen.routename,
                                          );
                                        },
                                        child: Text(
                                          "Login with phone number",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                color: Theme.of(context)
                                                    .canvasColor,
                                                fontSize: 16,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "By clicking continue, you agree \nto our Terms and conditions",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              fontSize: 16,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
