import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final IconData? iconData;
  final String? hintText;
  final TextInputType? keytype;
  final int? maxline;
  final int? minline;
  CustomTextField({
    this.textEditingController,
    this.iconData,
    this.hintText,
    this.keytype,
    this.maxline,
    this.minline,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: height,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.teal.shade700,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: TextFormField(
        maxLines: maxline,
        minLines: minline,
        style:
            TextStyle(color: Colors.white, fontSize: 21.0, fontFamily: "Acme"),
        cursorHeight: 26.0,
        cursorWidth: 3.0,
        controller: textEditingController,
        keyboardType: keytype,
        cursorColor: Colors.blue,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8),
            border: InputBorder.none,
            focusColor: Theme.of(context).primaryColor,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white, fontSize: 18.0)),
      ),
    );
  }
}
