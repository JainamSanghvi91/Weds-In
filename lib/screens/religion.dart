import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/screens/kudli.dart';
import 'package:wedsinui/size_config.dart';

class Religion extends StatefulWidget {
  static const String routename = '/religion-details-info';
  @override
  _ReligionState createState() => _ReligionState();
}

class _ReligionState extends State<Religion> {
  int select = -1;
  int select1 = -1;

  List religion = [
    "Hinduism",
    "Christanity",
    "Islam",
    "Jainism",
    "Buddhism",
    "Sikkhism",
    "Others",
  ];
  List caste = [
    "Brahmins",
    "Kshatriyas",
    "Vaishyas",
    "Kshudras",
    "Dalit",
    "Others",
  ];

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
              bottom: constraints.maxHeight * 0.01,
              right: constraints.maxWidth * 0.02,
            ),
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: select >= 0 && select1 >= 0
                    ? Color.fromRGBO(161, 32, 108, 1)
                    : Colors.white,
                foregroundColor: Colors.black,
                onPressed: () {
                  select >= 0 && select1 >= 0
                      ? Navigator.of(context).pushNamed(
                          Kundli.routename,
                        )
                      : Container();
                },
                child: Center(
                  child: Container(
                    child: SvgPicture.asset(
                      "assets/images/in-text.svg",
                      height: constraints.maxHeight * 0.03,
                      color: select >= 0 && select1 >= 0
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
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth * 0.08,
                      top: constraints.maxHeight * 0.1,
                    ),
                    child: Text(
                      "Which Religion do you practice ?",
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
                child: Column(
                  children: [
                    select == -1
                        ? Padding(
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
                                    select = 1;
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
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Religion *",
                                        style: TextStyle(
                                          color: Colors.pink[700],
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.08,
                              right: constraints.maxWidth * 0.08,
                              top: constraints.maxHeight * 0.04,
                            ),
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(35),
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
                                    borderRadius: BorderRadius.circular(35)),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          select = -1;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Religion *",
                                            style: TextStyle(
                                              color: Colors.pink[700],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_up,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 150,
                                      child: ListView.builder(
                                        itemCount: religion.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              religion[index],
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                    select1 == -1
                        ? Padding(
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
                                    select1 = 2;
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
                                      borderRadius: BorderRadius.circular(35)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Caste *",
                                        style: TextStyle(
                                          color: Colors.pink[700],
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.08,
                              right: constraints.maxWidth * 0.08,
                              top: constraints.maxHeight * 0.04,
                            ),
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(35),
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
                                    borderRadius: BorderRadius.circular(35)),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          select1 = -1;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Caste *",
                                            style: TextStyle(
                                              color: Colors.pink[700],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_up,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 150,
                                      child: ListView.builder(
                                        itemCount: caste.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              caste[index],
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
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
