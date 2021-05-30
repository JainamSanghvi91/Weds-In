import 'package:flutter/material.dart';

class CustomeButton extends StatefulWidget {
  final String? txt;

  const CustomeButton({this.txt});
  @override
  _CustomeButtonState createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Center(
          child: Text(
            widget.txt.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Theme.of(context).canvasColor),
          ),
        ),
      ),
    );
  }
}
