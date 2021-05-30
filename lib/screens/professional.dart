import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/screens/eductional.dart';
import 'package:wedsinui/screens/religion.dart';
import 'package:wedsinui/size_config.dart';

class ProfessionalDetails extends StatefulWidget {
  static const String routename = '/professional-details-info';
  @override
  _ProfessionalDetailsState createState() => _ProfessionalDetailsState();
}

class _ProfessionalDetailsState extends State<ProfessionalDetails> {
  int select = -1;
  int select1 = -1;
  int select2 = -1;
  int select3 = -1;
  List education = [
    "High School",
    "P.H.D",
    "Bachelors",
    "Masters",
    "Associative Degree",
    "Technical School",
  ];

  List occupation = [
    "Engineer",
    "Laywer",
    "Doctor",
    "Scientist",
    "Accountant",
    "Teacher",
  ];

  List income = [
    "200000 - 500000",
    "1000000",
    "1500000",
    "2000000",
    "2500000",
    "4000000",
  ];

  List works = [
    "School",
    "Hospital",
    "College",
    "Company",
    "HouseWife",
  ];
  //String? _chosenValue;

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
                          Educational.routename,
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
          body: SingleChildScrollView(
            child: Column(
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
                        "Professional \nDetails",
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
                Column(
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
                                        "Higher Degree *",
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
                                            "Higher Degree *",
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
                                      height: constraints.maxHeight * 0.2,
                                      child: ListView.builder(
                                        itemCount: education.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              education[index],
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
                                    select1 = 1;
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
                                        "Occupation *",
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
                                            "Occupation *",
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
                                      height: constraints.maxHeight * 0.2,
                                      child: ListView.builder(
                                        itemCount: occupation.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              occupation[index],
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
                    select2 == -1
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
                                    select2 = 1;
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
                                        "Income *",
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
                                          select2 = -1;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Income *",
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
                                      height: constraints.maxHeight * 0.2,
                                      child: ListView.builder(
                                        itemCount: income.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              income[index],
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
                    select3 == -1
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
                                    select3 = 1;
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
                                        "Works @",
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
                                          select3 = -1;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Works @",
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
                                      height: constraints.maxHeight * 0.2,
                                      child: ListView.builder(
                                        itemCount: works.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              works[index],
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
