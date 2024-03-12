import 'package:flutter/material.dart';
import 'package:atoz_cinema/widgets/custom_app_barpay.dart';
import 'package:atoz_cinema/widgets/date_selector.dart';
import 'package:atoz_cinema/widgets/location_text.dart';
import 'package:atoz_cinema/widgets/pay_button.dart';
import 'package:atoz_cinema/widgets/seat_selector.dart';
import 'package:atoz_cinema/widgets/time_selector.dart';

class PayingScreen extends StatefulWidget {
  final String movieName;

  PayingScreen({required this.movieName});

  @override
  _PayingScreenState createState() => _PayingScreenState();
}

class _PayingScreenState extends State<PayingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            //app bar
            CustomAppBar1("salar"),

            //date selector
            DateSelector(),

            //Time selector
            TimeSelector(),

            //Location and theatre
            LocationText(),

            //Seat selector
            SeatSelector(),

            //Pay button and seat categories
            PayButton(),
          ],
        ),
      ),
    );
  }
}
