import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/screens/personalDetails.dart';
import 'package:wedsinui/screens/professional.dart';
import 'package:wedsinui/size_config.dart';

class MarriedInfo extends StatefulWidget {
  static const String routename = '/married-info';
  @override
  _MarriedInfoState createState() => _MarriedInfoState();
}

class _MarriedInfoState extends State<MarriedInfo> {
  int select = -1;
  List name = [
    "Never Married",
    "Divorced",
    "Awaiting Divorced",
    "Widowed",
    "Anulled",
  ];
  @override
  Widget build(BuildContext context) {
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
                backgroundColor: select >= 0
                    ? Color.fromRGBO(161, 32, 108, 1)
                    : Colors.white,
                foregroundColor: Colors.black,
                onPressed: () {
                  select >= 0
                      ? Navigator.of(context).pushNamed(
                          PersonalDetails.routename,
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
                  "Martial Status",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: constraints.maxHeight * 0.04,
                    color: Colors.pink[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: constraints.maxHeight * 0.038),
                child: GridView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  controller: new ScrollController(keepScrollOffset: false),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      childAspectRatio: 9 / 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.05),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            select = index;
                            print(name[select]);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.05,
                              vertical: constraints.maxHeight * 0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            color: select == index
                                ? Colors.pink[800]
                                : Colors.white,
                          ),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                name[index],
                                style: TextStyle(
                                  fontSize: constraints.maxHeight * 0.02,
                                  color: select == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
