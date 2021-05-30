import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/screens/gender.dart';
import 'package:wedsinui/size_config.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  int select = -1;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints);
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
                backgroundColor: select == 1
                    ? Color.fromRGBO(161, 32, 108, 1)
                    : Colors.white,
                foregroundColor: Colors.pink,
                onPressed: () {
                  select == 1
                      ? Navigator.of(context).pushNamed(
                          GenderInfo.routename,
                        )
                      : Container();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: constraints.maxWidth * 0.08,
                  top: constraints.maxHeight * 0.1,
                ),
                child: Text(
                  "Making Profile For...",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: constraints.maxHeight * 0.04,
                    color: Colors.pink[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: constraints.maxWidth * 0.08,
                  top: constraints.maxHeight * 0.03,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      select = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.13,
                        vertical: constraints.maxHeight * 0.015),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      color: select == 1 ? Colors.pink[800] : Colors.white,
                    ),
                    child: Text(
                      "Self",
                      style: TextStyle(
                        fontSize: constraints.maxHeight * 0.02,
                        color: select == 1 ? Colors.white : Colors.black,
                      ),
                    ),
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
