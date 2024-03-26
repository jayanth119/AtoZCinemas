import 'package:flutter/material.dart';

class BuildChairs {
  static Widget chair(int status) {
    switch (status) {
      case 1: // Available
        return availableChair();
      case 2: // Selected
        return selectedChair();
      case 3: // Reserved
        return reservedChair();
      default:
        return Container(); // Default empty container
    }
  }

  static Widget selectedChair() {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }

  static Widget availableChair() {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }

  static Widget reservedChair() {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }
}
