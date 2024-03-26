import 'package:flutter/material.dart';

class CustomAppBar1 extends StatefulWidget {
  final String movieName;

  CustomAppBar1(this.movieName);

  @override
  _CustomAppBar1State createState() => _CustomAppBar1State();
}

class _CustomAppBar1State extends State<CustomAppBar1> {
  void showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("AlertDialog"),
      content: const Text("Would you like to continue Booking  ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 15,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0 / 2),
        child: Container(
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                widget.movieName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                left: 24,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Container(
                      height: size.height * 0.075,
                      width: size.width * 0.15,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.white.withOpacity(0.35)),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
