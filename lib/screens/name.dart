import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedsinui/screens/marriedstatus.dart';

class NameInfo extends StatefulWidget {
  static const String routename = '/name-info';
  @override
  _NameInfoState createState() => _NameInfoState();
}

class _NameInfoState extends State<NameInfo> {
  Map<String?, String?> _userdata = {
    'first': '',
    'last': '',
  };
  bool? checkboxvalue = false;
  final GlobalKey<FormState> _forrmkey = GlobalKey();
  int select = 1;
  @override
  Widget build(BuildContext context) {
    Future<void> _submit() async {
      var valid = _forrmkey.currentState!.validate();

      if (valid) {
        _forrmkey.currentState!.save();
        print(_userdata['first']);
        print(_userdata['last']);
      }
    }

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
                backgroundColor:
                    select > 0 ? Color.fromRGBO(161, 32, 108, 1) : Colors.white,
                foregroundColor: Colors.black,
                onPressed: () {
                  _submit();
                  select > 0
                      ? Navigator.of(context).pushNamed(
                          MarriedInfo.routename,
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
          body: Form(
            key: _forrmkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: constraints.maxWidth * 0.08,
                    top: constraints.maxHeight * 0.1,
                  ),
                  child: Text(
                    "May we know your Name ?",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: constraints.maxHeight * 0.04,
                      color: Colors.pink[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 20,
                    bottom: 5,
                  ),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        35.0,
                      ),
                    ),
                    child: TextFormField(
                      initialValue: _userdata['first'],
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              35.0,
                            ),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        ),
                        contentPadding: EdgeInsets.only(left: 25),
                        hintText: "First Name",
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.pink[700]),
                      ),
                      validator: (value) {
                        if (value.toString().length == 0) {
                          return "First Name should not be empty";
                        }
                      },
                      onSaved: (value) {
                        _userdata['first'] = value;
                        print("Name of Product:");
                        print(_userdata['first']);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 20,
                    bottom: 5,
                  ),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        35.0,
                      ),
                    ),
                    child: TextFormField(
                      initialValue: _userdata['last'],
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              35.0,
                            ),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        ),
                        contentPadding: EdgeInsets.only(left: 25),
                        hintText: "Last Name",
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.pink[700]),
                      ),
                      validator: (value) {
                        if (value.toString().length == 0) {
                          return "Last Name should not be empty";
                        }
                      },
                      onSaved: (value) {
                        _userdata['last'] = value;
                        print("Name of Product:");
                        print(_userdata['last']);
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: constraints.maxWidth * 0.06,
                    top: 10,
                  ),
                  child: Text(
                    "Your name will appear only after the match",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.pink[700],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: checkboxvalue,
                      checkColor: Colors.pink[700],
                      //focusColor: Colors.white,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          checkboxvalue = value;
                        });
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Text(
                        "Hide my name even after the match",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.pink[700],
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
