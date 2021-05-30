import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardButton extends StatefulWidget {
  @override
  _CardButtonState createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(70),
      ),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            child: SvgPicture.asset(
              "assets/images/in-text.svg",
              color: Color.fromRGBO(161, 32, 108, 1),
            ),
          ),
        ),
      ),
    );
  }
}

class CardButton2 extends StatefulWidget {
  @override
  _CardButton2State createState() => _CardButton2State();
}

class _CardButton2State extends State<CardButton2> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(70),
      ),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            child: SvgPicture.asset(
              "assets/images/in-text.svg",
              color: Color.fromRGBO(161, 32, 108, 1),
            ),
          ),
        ),
      ),
    );
  }
}
