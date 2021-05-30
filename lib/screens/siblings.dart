import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/screens/badHabits.dart';
import 'package:wedsinui/screens/religion.dart';
import 'package:wedsinui/size_config.dart';

class Siblings extends StatefulWidget {
  static const String routename = '/siblings-details-info';
  @override
  _SiblingsState createState() => _SiblingsState();
}

class _SiblingsState extends State<Siblings> {
  int select = -1;
  int select1 = -1;

  List number = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print("height is ${constraints.maxHeight}");
      print("width is ${constraints.maxWidth}");
      return SafeArea(
        child: Scaffold(
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(BadHabit.routename);
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: constraints.maxWidth * 0.15,
                      bottom: constraints.maxHeight * 0.05),
                  child: Text(
                    "Skip for Now",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.pink[700],
                    ),
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.09,
                padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.02),
                child: FittedBox(
                  child: FloatingActionButton(
                    backgroundColor: select >= 0
                        ? Color.fromRGBO(161, 32, 108, 1)
                        : Colors.white,
                    foregroundColor: Colors.black,
                    onPressed: () {
                      select >= 0
                          ? Navigator.of(context).pushNamed(
                              BadHabit.routename,
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
            ],
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
                  "Personal \nDetails",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: constraints.maxHeight * 0.04,
                    color: Colors.pink[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                top: constraints.maxHeight * 0.04,
                                left: constraints.maxWidth * 0.06,
                              ),
                              child: Text(
                                "Brother",
                                style: TextStyle(
                                    fontSize: 0.023 * constraints.maxHeight,
                                    color: Colors.pink[700]),
                              ),
                            ),
                            select == -1
                                ? Padding(
                                    padding: EdgeInsets.only(
                                      left: constraints.maxWidth * 0.02,
                                      top: constraints.maxHeight * 0.04,
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
                                            right: constraints.maxWidth * 0.03,
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
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(),
                                              Icon(
                                                Icons.arrow_drop_down,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                      left: constraints.maxWidth * 0.02,
                                      top: constraints.maxHeight * 0.04,
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
                                            right: constraints.maxWidth * 0.03,
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
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                select = -1;
                                              });
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height:
                                                      constraints.maxHeight *
                                                          0.2,
                                                  child: ListView.builder(
                                                    itemCount: number.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 8.0),
                                                        child: Text(
                                                          number[index],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_drop_up,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: constraints.maxWidth * 0.07,
                                top: constraints.maxHeight * 0.04,
                              ),
                              child: Text(
                                "Sister",
                                style: TextStyle(
                                    fontSize: 0.023 * constraints.maxHeight,
                                    color: Colors.pink[700]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: constraints.maxWidth * 0.05,
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
                                      right: constraints.maxWidth * 0.03,
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(),
                                        Icon(
                                          Icons.arrow_drop_down,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              top: constraints.maxHeight * 0.04,
                              left: constraints.maxWidth * 0.05,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Married",
                                  style: TextStyle(
                                      fontSize: 0.02 * constraints.maxHeight,
                                      color: Colors.pink[700]),
                                ),
                                Text(
                                  "Brother",
                                  style: TextStyle(
                                      fontSize: 0.015 * constraints.maxHeight,
                                      color: Colors.pink[700]),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.02,
                              top: constraints.maxHeight * 0.04,
                            ),
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(35),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    select = 3;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: constraints.maxWidth * 0.1,
                                    right: constraints.maxWidth * 0.03,
                                    top: constraints.maxHeight * 0.01,
                                    bottom: constraints.maxHeight * 0.01,
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(),
                                      Icon(
                                        Icons.arrow_drop_down,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.06,
                              top: constraints.maxHeight * 0.04,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Married",
                                  style: TextStyle(
                                      fontSize: 0.02 * constraints.maxHeight,
                                      color: Colors.pink[700]),
                                ),
                                Text(
                                  "Sister",
                                  style: TextStyle(
                                      fontSize: 0.015 * constraints.maxHeight,
                                      color: Colors.pink[700]),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.05,
                              top: constraints.maxHeight * 0.04,
                            ),
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(35),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    select = 4;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: constraints.maxWidth * 0.1,
                                    right: constraints.maxWidth * 0.03,
                                    top: constraints.maxHeight * 0.01,
                                    bottom: constraints.maxHeight * 0.01,
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(),
                                      Icon(
                                        Icons.arrow_drop_down,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
