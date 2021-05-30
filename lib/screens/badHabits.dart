import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/screens/gender.dart';
import 'package:wedsinui/screens/healthHabits.dart';
import 'package:wedsinui/screens/personalDetails.dart';
import 'package:wedsinui/size_config.dart';

class BadHabit extends StatefulWidget {
  static const String routename = '/badhabit-info';
  @override
  _BadHabitState createState() => _BadHabitState();
}

class _BadHabitState extends State<BadHabit> {
  int select = -1;
  int select1 = -1;
  int select2 = -1;
  List name = [
    "No",
    "Ocassionally",
    "Yes",
    "Trying to quit",
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
                backgroundColor: select >= 0 && select1 >= 0 && select2 >= 0
                    ? Color.fromRGBO(161, 32, 108, 1)
                    : Colors.white,
                foregroundColor: Colors.black,
                onPressed: () {
                  select >= 0 && select1 >= 0 && select2 >= 0
                      ? Navigator.of(context).pushNamed(
                          HealthHabit.routename,
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
                        "Do you smoke ?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: constraints.maxHeight * 0.04,
                          color: Colors.pink[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: constraints.maxWidth * 0.06,
                        right: constraints.maxWidth * 0.06,
                      ),
                      padding:
                          EdgeInsets.only(top: constraints.maxHeight * 0.038),
                      child: GridView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        controller:
                            new ScrollController(keepScrollOffset: false),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: constraints.maxWidth * 0.045,
                            mainAxisSpacing: constraints.maxHeight * 0.02,
                            childAspectRatio: 8 / 2),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: InkWell(
                              onTap: () {},
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    select = index;
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
                                          fontSize:
                                              constraints.maxHeight * 0.02,
                                          color: select == index
                                              ? Colors.white
                                              : Colors.black,
                                        ),
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
                Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    left: constraints.maxWidth * 0.05,
                    right: constraints.maxWidth * 0.05,
                  ),
                  child: Divider(
                    thickness: 1.5,
                    color: Colors.pink[200],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: constraints.maxWidth * 0.08,
                        top: constraints.maxHeight * 0.016,
                      ),
                      child: Text(
                        "Do you drink ?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: constraints.maxHeight * 0.04,
                          color: Colors.pink[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: constraints.maxWidth * 0.06,
                        right: constraints.maxWidth * 0.06,
                      ),
                      padding:
                          EdgeInsets.only(top: constraints.maxHeight * 0.026),
                      child: GridView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        controller:
                            new ScrollController(keepScrollOffset: false),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: constraints.maxWidth * 0.045,
                            mainAxisSpacing: constraints.maxHeight * 0.02,
                            childAspectRatio: 8 / 2),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: InkWell(
                              onTap: () {},
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    select1 = index;
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
                                    color: select1 == index
                                        ? Colors.pink[800]
                                        : Colors.white,
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        name[index],
                                        style: TextStyle(
                                          fontSize:
                                              constraints.maxHeight * 0.02,
                                          color: select1 == index
                                              ? Colors.white
                                              : Colors.black,
                                        ),
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
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: constraints.maxWidth * 0.05,
                    right: constraints.maxWidth * 0.05,
                  ),
                  child: Divider(
                    thickness: 1.5,
                    color: Colors.pink[200],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: constraints.maxWidth * 0.08,
                        top: constraints.maxHeight * 0.016,
                      ),
                      child: Text(
                        "Do you consume Marijuana ?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: constraints.maxHeight * 0.04,
                          color: Colors.pink[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: constraints.maxWidth * 0.06,
                        right: constraints.maxWidth * 0.06,
                      ),
                      padding:
                          EdgeInsets.only(top: constraints.maxHeight * 0.026),
                      child: GridView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        controller:
                            new ScrollController(keepScrollOffset: false),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: constraints.maxWidth * 0.045,
                            mainAxisSpacing: constraints.maxHeight * 0.02,
                            childAspectRatio: 8 / 2),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: InkWell(
                              onTap: () {},
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    select2 = index;
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
                                    color: select2 == index
                                        ? Colors.pink[800]
                                        : Colors.white,
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        name[index],
                                        style: TextStyle(
                                          fontSize:
                                              constraints.maxHeight * 0.02,
                                          color: select2 == index
                                              ? Colors.white
                                              : Colors.black,
                                        ),
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
