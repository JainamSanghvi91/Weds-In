import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:wedsinui/screens/professional.dart';
import 'package:wedsinui/size_config.dart';

class Kundli extends StatefulWidget {
  static const String routename = '/Kundli-details-info';
  @override
  _KundliState createState() => _KundliState();
}

class _KundliState extends State<Kundli> {
  int select = -1;
  int select1 = -1;

  late DateTime _dateTime;

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
              bottom: constraints.maxHeight * 0.01,
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
                          ProfessionalDetails.routename,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth * 0.08,
                      right: constraints.maxWidth * 0.06,
                      top: constraints.maxHeight * 0.1,
                    ),
                    child: Text(
                      "Do you believe in kundli ?",
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
                      top: constraints.maxHeight * 0.013,
                    ),
                    child: Text(
                      "Mandatory*",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: constraints.maxHeight * 0.02,
                        color: Colors.pink[800],
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.08,
                              right: constraints.maxWidth * 0.03,
                              top: constraints.maxHeight * 0.02),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                select = 5;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: constraints.maxWidth * 0.05,
                                  vertical: constraints.maxHeight * 0.015),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: select == 5 || select == 1 || select == 2
                                    ? Colors.pink[800]
                                    : Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 21.0),
                                    child: Text(
                                      "Yes",
                                      style: TextStyle(
                                        fontSize: constraints.maxHeight * 0.02,
                                        color: select == 5 ||
                                                select == 1 ||
                                                select == 2
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.pink[300],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: constraints.maxWidth * 0.03,
                              top: constraints.maxHeight * 0.02),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                select = 6;
                              });
                            },
                            child: Container(
                              height: 45,
                              padding: EdgeInsets.symmetric(
                                  horizontal: constraints.maxWidth * 0.115,
                                  vertical: constraints.maxHeight * 0.013),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: select == 6 || select == 3 || select == 4
                                    ? Colors.pink[800]
                                    : Colors.white,
                              ),
                              child: FittedBox(
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                    fontSize: constraints.maxHeight * 0.02,
                                    color: select == 6 ||
                                            select == 3 ||
                                            select == 4
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    select == 5 || select == 1 || select == 2
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.09,
                                  top: constraints.maxHeight * 0.025,
                                ),
                                child: Text(
                                  "What is Kundli?",
                                  style: TextStyle(
                                    fontSize: constraints.maxHeight * 0.019,
                                    color: Colors.pink[700],
                                  ),
                                ),
                              ),
                              select == 5 || select == 2
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        left: constraints.maxWidth * 0.08,
                                        right: constraints.maxWidth * 0.08,
                                        top: constraints.maxHeight * 0.02,
                                      ),
                                      child: Material(
                                        elevation: 2,
                                        borderRadius: BorderRadius.circular(35),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              select = 1;
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              left: constraints.maxWidth * 0.1,
                                              right: constraints.maxWidth * 0.1,
                                              top: constraints.maxHeight * 0.01,
                                              bottom:
                                                  constraints.maxHeight * 0.01,
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(35)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Time of Birth *",
                                                  style: TextStyle(
                                                    color: Colors.pink[700],
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.pink[300],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(
                                        left: constraints.maxWidth * 0.08,
                                        right: constraints.maxWidth * 0.08,
                                        top: constraints.maxHeight * 0.02,
                                      ),
                                      child: Material(
                                        elevation: 2,
                                        borderRadius: BorderRadius.circular(35),
                                        child: Container(
                                          padding: EdgeInsets.only(
                                            left: constraints.maxWidth * 0.1,
                                            right: constraints.maxWidth * 0.1,
                                            top: constraints.maxHeight * 0.01,
                                            bottom:
                                                constraints.maxHeight * 0.01,
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(35)),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    select = 5;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Time of Birth *",
                                                      style: TextStyle(
                                                        color: Colors.pink[700],
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_drop_up,
                                                      color: Colors.pink[300],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TimePickerSpinner(
                                                is24HourMode: false,
                                                isShowSeconds: true,
                                                normalTextStyle: TextStyle(
                                                  fontSize: 20,
                                                ),
                                                highlightedTextStyle: TextStyle(
                                                  fontSize: 20,
                                                ),
                                                spacing: 15,
                                                itemHeight: 70,
                                                isForce2Digits: true,
                                                onTimeChange: (time) {
                                                  setState(() {
                                                    _dateTime = time;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.08,
                                  right: constraints.maxWidth * 0.08,
                                  top: constraints.maxHeight * 0.04,
                                ),
                                child: Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(35),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        select = 2;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left: constraints.maxWidth * 0.1,
                                        right: constraints.maxWidth * 0.1,
                                        top: constraints.maxHeight * 0.01,
                                        bottom: constraints.maxHeight * 0.01,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Location of Birth *",
                                            style: TextStyle(
                                              color: Colors.pink[700],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.pink[300],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.09,
                                  top: constraints.maxHeight * 0.018,
                                  right: constraints.maxWidth * 0.09,
                                ),
                                child: Text(
                                  "You'll be able to see the detailed kundli report of people who believe in the power of stars.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: constraints.maxHeight * 0.018,
                                    color: Colors.pink[700],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
