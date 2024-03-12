import 'package:flutter/material.dart';

itemProfile(String title, String subtitle, IconData iconData) {
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
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      leading: Icon(
        iconData,
        color: Colors.red,
      ),
    ),
  );
}
