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
  String selectedDate = "";
  String selectedTime = "";
  List<String> selectedSeats = [];
  int amount = 0;

  void updateSelectedDate(String date) {
    setState(() {
      selectedDate = date;
    });
  }

  void updateSelectedTime(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  void updateSelectedSeats(List<String> seats) {
    setState(() {
      selectedSeats = seats;
    });
  }

  void updateAmount(int newAmount) {
    setState(() {
      amount = newAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            CustomAppBar1(widget.movieName),
            DateSelector(onDateSelected: updateSelectedDate),
            TimeSelector(onTimeSelected: updateSelectedTime),
            LocationText(),
            SeatSelector(
              onSeatsSelected: updateSelectedSeats,
              onAmountUpdated: updateAmount,
            ),
            PayButton(
              movieName: widget.movieName,
              selectedDate: selectedDate,
              selectedTime: selectedTime,
              selectedSeats: selectedSeats,
              amount: amount,
            ),
          ],
        ),
      ),
    );
  }
}
