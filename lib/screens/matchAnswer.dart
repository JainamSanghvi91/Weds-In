import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Matching extends StatelessWidget {
  static const String routename = '/matching-page';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print("height is ${constraints.maxHeight}");
      print("width is ${constraints.maxWidth}");
      return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: SvgPicture.asset("assets/images/title.svg"),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(
                    top: constraints.maxHeight * 0.06,
                  ),
                  child: Text(
                    "Thank you for your time our\ncustomer executive will \nreach out to you shortly",
                    style: TextStyle(
                      fontSize: constraints.maxHeight * 0.035,
                      color: Colors.pink[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
