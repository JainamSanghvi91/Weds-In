import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/screens/name.dart';
import 'package:wedsinui/size_config.dart';

class GenderInfo extends StatefulWidget {
  static const String routename = '/gender-info';
  @override
  _GenderInfoState createState() => _GenderInfoState();
}

class _GenderInfoState extends State<GenderInfo> {
  int select = -1;
  int select1 = -1;
  int select3 = -1;

  var genders = [
    "Agender",
    "Transgender",
    "Pangender",
    "Genderqueer",
    "Non-binary",
    "Androgyne",
  ];

  var _category;
  changGender(String ans) {
    setState(() {
      _category = ans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print("height is ${constraints.maxHeight}");
      print("width is ${constraints.maxWidth}");
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: Container(
            height: constraints.maxHeight * 0.09,
            padding: EdgeInsets.only(
              bottom: constraints.maxHeight * 0.012,
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
                          NameInfo.routename,
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
                  "What Gender are you ?",
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
                  left: constraints.maxWidth * 0.05,
                  top: constraints.maxHeight * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            select = 6;
                            select3 = 0;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.1,
                              vertical: constraints.maxHeight * 0.015),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            color:
                                select == 6 ? Colors.pink[800] : Colors.white,
                          ),
                          child: Text(
                            "Male",
                            style: TextStyle(
                              fontSize: constraints.maxHeight * 0.02,
                              color: select == 6 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          select = 7;
                          select3 = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: constraints.maxWidth * 0.09,
                            vertical: constraints.maxHeight * 0.015),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          color: select == 7 ? Colors.pink[800] : Colors.white,
                        ),
                        child: FittedBox(
                          child: Text(
                            "Female",
                            style: TextStyle(
                              fontSize: constraints.maxHeight * 0.02,
                              color: select == 7 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          select = 8;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: constraints.maxWidth * 0.05,
                            vertical: constraints.maxHeight * 0.015),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "More",
                              style: TextStyle(
                                fontSize: constraints.maxHeight * 0.02,
                                color: select == 8 ||
                                        select == 9 ||
                                        select >= 0 && select <= 5 ||
                                        select3 == 1
                                    ? Colors.pink[700]
                                    : Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              select >= 0 && select <= 5 ||
                      select == 8 ||
                      select == 9 ||
                      select3 == 1
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20,
                              top: constraints.maxHeight * 0.026,
                              right: 20),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    select = 9;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              "How do you identify yourself ?",
                                              style: TextStyle(
                                                fontSize: 17,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              select >= 0 && select <= 5 ||
                                      select == 9 ||
                                      select3 == 1
                                  ? Container(
                                      height: 55,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        physics: const ClampingScrollPhysics(),
                                        itemCount: genders.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            // color: Colors.blue,
                                            padding: const EdgeInsets.all(10.0),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  print(genders[index]);
                                                  select = index;
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      40, //constraints.maxWidth * 0.09,
                                                  vertical: 5,
                                                ), //constraints.maxHeight * 0.015),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                  ),
                                                  color: select == index
                                                      ? Colors.pink[800]
                                                      : Colors.white,
                                                ),
                                                child: Text(
                                                  genders[index],
                                                  style: TextStyle(
                                                    fontSize:
                                                        18, //constraints.maxHeight * 0.02,
                                                    color: select == index
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Container(),
                              select >= 0 && select <= 5 ||
                                      select == 8 ||
                                      select == 9 ||
                                      select3 == 1
                                  ? RadioListTile(
                                      value: 1,
                                      groupValue: select3,
                                      activeColor: Colors.pink[800],
                                      title: Text(
                                        "Visible on Profile",
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          select3 = 1;
                                        });
                                      },
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(),
              Container(
                padding: EdgeInsets.only(
                  left: constraints.maxWidth * 0.08,
                  top: constraints.maxHeight * 0.02,
                  bottom: constraints.maxHeight * 0.04,
                ),
                child: Text(
                  "Show me people you are looking for ?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: constraints.maxHeight * 0.03,
                    color: Colors.pink[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth * 0.08,
                      right: constraints.maxWidth * 0.03,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          select1 = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: constraints.maxWidth * 0.1,
                            vertical: constraints.maxHeight * 0.015),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          color: select1 == 1 ? Colors.pink[800] : Colors.white,
                        ),
                        child: Text(
                          "Male",
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.02,
                            color: select1 == 1 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        select1 = 2;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.09,
                          vertical: constraints.maxHeight * 0.015),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        color: select1 == 2 ? Colors.pink[800] : Colors.white,
                      ),
                      child: FittedBox(
                        child: Text(
                          "Female",
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.02,
                            color: select1 == 2 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
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
