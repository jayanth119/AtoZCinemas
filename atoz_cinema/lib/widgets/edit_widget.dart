import 'package:atoz_cinema/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

editProfile(String title, IconData iconData) {
  TextEditingController user = TextEditingController();
  final bor = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none);
  return Container(
    decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 5),
              color: Colors.deepOrange.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 10)
        ]),
    child: ListTile(
      title: InputField(
        user: user,
        bor: bor,
        validator: (value) {
          return null;
        },
        hinttext: title,
        icon: iconData,
        bool1: false,
      ),
      leading: Icon(
        iconData,
        color: Colors.red,
      ),
    ),
  );
}
