import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wedsinui/screens/sign/signUp.dart';
import 'package:wedsinui/widgets/button.dart';

class AllowLocation extends StatefulWidget {
  @override
  _AllowLocationState createState() => _AllowLocationState();
}

class _AllowLocationState extends State<AllowLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 150, right: 30, left: 30),
        children: [
          Column(
            children: [
              Text(
                "Allow wedsin to access location",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Color.fromRGBO(161, 32, 108, 1), fontSize: 32),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 45,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  size: 55,
                  color: Theme.of(context).canvasColor,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              InkWell(
                  // onTap: () {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => SignUp()));
                  // },
                  child: CustomeButton(txt: "Allow")),
              SizedBox(
                height: 70,
              ),
              Center(
                child: Container(
                  child: SvgPicture.asset(
                    "assets/images/in-text.svg",
                    color: Color.fromRGBO(161, 32, 108, 1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
