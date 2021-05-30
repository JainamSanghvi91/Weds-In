import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/size_config.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);
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
                    "Application is getting ready! \nPlease wait!",
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
