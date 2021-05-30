import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/screens/matchAnswer.dart';
import 'package:wedsinui/size_config.dart';

class Verified extends StatelessWidget {
  static const String routename = '/verified-page';
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
                    Matching.routename,
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
                  "Verifying your \nAccount",
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
              Padding(
                padding: EdgeInsets.only(
                  bottom: constraints.maxHeight * 0.02,
                ),
                child: Center(
                  child: Container(
                    child: SvgPicture.asset("assets/images/in-logo.svg"),
                  ),
                ),

                // CircleAvatar(
                //   radius: 45,
                //   backgroundColor: Colors.pink[900],
                //   child: Container(
                //     child: Text(
                //       "in",
                //       style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: constraints.maxHeight * 0.05,
                //         color: Colors.white,
                //         fontStyle: FontStyle.italic,
                //       ),
                //     ),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
