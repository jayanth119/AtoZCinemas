import 'package:flutter/material.dart';

class CustomAppBar1 extends StatefulWidget {
  final String movieName;

  CustomAppBar1(this.movieName);

  @override
  _CustomAppBar1State createState() => _CustomAppBar1State();
}

class _CustomAppBar1State extends State<CustomAppBar1> {
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
                      Navigator.pop(context);
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
