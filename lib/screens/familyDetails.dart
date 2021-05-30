import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/screens/badHabits.dart';
import 'package:wedsinui/screens/religion.dart';
import 'package:wedsinui/screens/siblings.dart';
import 'package:wedsinui/size_config.dart';

class FamilyDetails extends StatefulWidget {
  static const String routename = '/family-details-info';
  @override
  _FamilyDetailsState createState() => _FamilyDetailsState();
}

class _FamilyDetailsState extends State<FamilyDetails> {
  int select = -1;
  int select1 = -1;
  int select2 = -1;
  int select3 = -1;
  int select4 = -1;

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
                padding: EdgeInsets.only(
                  bottom: constraints.maxHeight * 0.02,
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
                              Siblings.routename,
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: constraints.maxWidth * 0.08,
                    top: constraints.maxHeight * 0.1,
                  ),
                  child: Text(
                    "Family Details...",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: constraints.maxHeight * 0.04,
                      color: Colors.pink[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                                        "Family Type *",
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
                                            "Family Type *",
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
                                        "Fathers Occupation *",
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
                                            "Fathers Occupation *",
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
                                        "Mothers Occupation *",
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
                                            "Mothers Occupation *",
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
                                        "Family living in",
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
                                            "Family living in",
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
                    select4 == -1
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
                                    select4 = 1;
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
                                        "Family income",
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
                                          select4 = -1;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Family income",
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
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: constraints.maxWidth * 0.08,
                        right: constraints.maxWidth * 0.08,
                        top: constraints.maxHeight * 0.05,
                        bottom: constraints.maxHeight * 0.01,
                      ),
                      child: Center(
                        child: Text(
                          "Sibling Details",
                          style: TextStyle(
                            color: Colors.pink[700],
                            fontSize: constraints.maxHeight * 0.025,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Siblings.routename);
                      },
                      child: Container(
                        child: CircleAvatar(
                          maxRadius: 25,
                          minRadius: 18,
                          backgroundColor: Colors.pink[700],
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
