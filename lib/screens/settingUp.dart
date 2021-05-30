import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/screens/verified.dart';
import 'package:wedsinui/size_config.dart';

class SettingUp extends StatelessWidget {
  static const String routename = '/setting-up-page';
  @override
  Widget build(BuildContext context) {
    int select = 0;
    return LayoutBuilder(builder: (context, constraints) {
      print("height is ${constraints.maxHeight}");
      print("width is ${constraints.maxWidth}");
      return SafeArea(
        child: Scaffold(
          floatingActionButton: Container(
            height: constraints.maxHeight * 0.09,
            padding: EdgeInsets.only(
              bottom: constraints.maxHeight * 0.012,
              right: constraints.maxWidth * 0.02,
            ),
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(161, 32, 108, 1),
                foregroundColor: Colors.black,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    Verified.routename,
                  );
                },
                child: Center(
                  child: Container(
                    child: SvgPicture.asset(
                      "assets/images/in-text.svg",
                      height: constraints.maxHeight * 0.03,
                      color: select >= 0
                          ? Colors.white
                          : Color.fromRGBO(255, 234, 247, 1),
                    ),
                    // Text(
                    //   "in",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: constraints.maxHeight * 0.03,
                    //     color: Colors.pink[100],
                    //     fontStyle: FontStyle.italic,
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Setting Up \nYour Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: constraints.maxHeight * 0.04,
                    color: Colors.pink[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.2,
                  vertical: constraints.maxHeight * 0.02,
                ),
                child: Divider(
                  thickness: 1.5,
                  color: Colors.grey[300],
                ),
              ),
              Center(
                child: Container(
                  child: SvgPicture.asset("assets/images/setting-up.svg"),
                ),
              ),
              // Stack(
              //   children: [
              //     Center(
              //       child: Container(
              //         height: 140,
              //         width: 140,
              //         decoration: BoxDecoration(
              //           color: Colors.grey,
              //           boxShadow: [BoxShadow(color: Colors.white70)],
              //           borderRadius: BorderRadius.circular(
              //             70,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Center(
              //       child: Container(
              //         height: 110,
              //         width: 110,
              //         decoration: BoxDecoration(
              //           color: Colors.pink,
              //           boxShadow: [BoxShadow(color: Colors.white70)],
              //           borderRadius: BorderRadius.circular(
              //             70,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Center(
              //       child: CircleAvatar(
              //         radius: 45,
              //         backgroundColor: Colors.white,
              //         child: Center(
              //           child: Container(
              //             child: Icon(
              //               Icons.person,
              //               color: Colors.pink[700],
              //               size: 60,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      );
    });
  }
}
