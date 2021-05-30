import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/screens/religion.dart';
import 'package:wedsinui/size_config.dart';

class PersonalDetails extends StatefulWidget {
  static const String routename = '/peronal-details-info';
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  int select = -1;
  int select1 = -1;
  //String? _chosenValue;
  List name = [
    "Birth",
    "Descent",
    "Registration",
    "Naturalisation",
  ];
  late DateTime _selectedDate;

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
                          Religion.routename,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Citizenship *",
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
                    ),
                    select == 1
                        ? Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: GridView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              controller:
                                  new ScrollController(keepScrollOffset: false),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 15,
                                      childAspectRatio: 11 / 2),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.only(left: 32, right: 32),
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
                                            horizontal:
                                                constraints.maxWidth * 0.05,
                                            vertical:
                                                constraints.maxHeight * 0.01),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
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
                                                    constraints.maxHeight *
                                                        0.02,
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
                          )
                        : Container(),
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
                                borderRadius: BorderRadius.circular(35)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Height *",
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
                    ),
                    select == 2
                        ? Container(
                            height: 100,
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: CupertinoPicker(
                                diameterRatio: 1,
                                itemExtent: 30,
                                onSelectedItemChanged: (int i) {
                                  print(i);
                                },
                                children: [
                                  Text("5'10''"),
                                  Text("5'11''"),
                                  Text("6'00''"),
                                  Text("6'01''"),
                                ],
                              ),
                            ),
                          )
                        : Container(),
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
                              select = 3;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Birthdate *",
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
                    ),
                    select == 3
                        ? DatePickerWidget(
                            looping: false, // default is not looping
                            firstDate: DateTime(1990, 01, 01),
                            lastDate: DateTime(2030, 1, 1),
                            initialDate: DateTime(1991, 10, 12),
                            dateFormat: "dd-MMM-yyyy",
                            locale: DatePicker.localeFromString('en'),
                            onChange: (DateTime newDate, _) {
                              _selectedDate = newDate;
                              print(_selectedDate);
                            },
                            pickerTheme: DateTimePickerTheme(
                              itemTextStyle:
                                  TextStyle(color: Colors.black, fontSize: 19),
                              dividerColor: Colors.blue,
                            ),
                          )
                        : Container(),
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
                              select = 4;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Location *",
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
