import 'package:flutter/material.dart';

class CustometextField extends StatefulWidget {
  final String? txt;
  final TextInputType? keytype;
  final TextEditingController? ctr;
  final EdgeInsetsGeometry? paddind;
  final String? Function(String?)? callback;
  final IconData? sufIcon;

  CustometextField(
      {this.txt,
      this.keytype,
      this.ctr,
      this.paddind,
      this.callback,
      this.sufIcon});
  @override
  _CustometextFieldState createState() => _CustometextFieldState();
}

class _CustometextFieldState extends State<CustometextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3,
          shadowColor: Color.fromRGBO(161, 32, 108, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              keyboardType: widget.keytype,
              controller: widget.ctr,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14, color: Color.fromRGBO(161, 32, 108, 1)),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.txt,
                  suffixIcon: Icon(
                    widget.sufIcon,
                    color: Colors.pink[200],
                  ),
                  hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14, color: Color.fromRGBO(161, 32, 108, 1)),
                  contentPadding: EdgeInsets.only(left: 15, top: 15)),
              validator: widget.callback,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
