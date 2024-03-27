// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:atoz_cinema/donotshow.dart';

class PayButton extends StatefulWidget {
  final String movieName;
  final String selectedDate;
  final String selectedTime;
  final List<String> selectedSeats;
  final int amount;

  PayButton({
    required this.movieName,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedSeats,
    required this.amount,
  });

  @override
  State<PayButton> createState() => _PayButtonState();
}

class _PayButtonState extends State<PayButton> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, Sucesser);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, Failure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, Exwallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void payment(int amount) {
    var options = {
      'key': apikeypayment, // Replace with your Razorpay key
      'amount': amount * 1000,
      'name': 'jayanth',
      'prefill': {
        'contact': '8179714811',
        'email': 'jayanthunofficial@gmail.com'
      },
      'external': {
        'wallets': ['payment']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void Sucesser(PaymentSuccessResponse response) {
    // Create a BookedMovie object with payment details
    BookedMovie bookedMovie = BookedMovie(
      movieName: widget.movieName,
      selectedDate: widget.selectedDate,
      selectedTime: widget.selectedTime,
      selectedSeats: widget.selectedSeats,
      amount: widget.amount,
      paymentId: response.paymentId!, // Add payment ID here
    );

    // Add the booked movie to the provider
    Provider.of<BookedMoviesProvider>(context, listen: false)
        .addBookedMovie(bookedMovie);

    // Show success message
    Fluttertoast.showToast(
      msg: 'Payment Successful: ${response.paymentId}',
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void Failure(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: 'Payment Failure: ${response.message}');
  }

  void Exwallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: 'External Wallet: ${response.walletName}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 13,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0 * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.white),
                      ),
                    ),
                    const Text(
                      "Available",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                    ),
                    const Text(
                      "Reserved",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 15.0,
                      width: 15.0,
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red),
                    ),
                    const Text(
                      "Selected",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height * 0.08,
                width: size.width * 0.45,
                child: Center(
                  child: Text(
                    '\$${widget.amount}', // Display total amount
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30.0)),
                  ),
                  minimumSize: Size(size.width * 0.45, size.width * 0.08),
                ),
                onPressed: () {
                  if (widget.movieName.isNotEmpty &&
                      widget.selectedDate.isNotEmpty &&
                      widget.selectedTime.isNotEmpty &&
                      widget.selectedSeats.isNotEmpty &&
                      widget.amount > 0) {
                    _handleBooking(context);
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Error"),
                            content: const Text(
                                'Please select movie details and seats.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        });
                  }
                },
                child: const Text(
                  'Pay',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _handleBooking(BuildContext context) {
    payment(widget.amount);
    if (kDebugMode) {
      print('Movie: ${widget.movieName}');
      print('Date: ${widget.selectedDate}');
      print('Time: ${widget.selectedTime}');
      print('Selected Seats: ${widget.selectedSeats}');
      print('Amount: ${widget.amount}');
    }
  }
}

class BookedMovie {
  final String movieName;
  final String selectedDate;
  final String selectedTime;
  final List<String> selectedSeats;
  final int amount;
  final String paymentId;

  BookedMovie({
    required this.movieName,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedSeats,
    required this.amount,
    required this.paymentId,
  });
}

// Provider class to manage the list of booked movies
class BookedMoviesProvider extends ChangeNotifier {
  List<BookedMovie> _bookedMovies = [];

  List<BookedMovie> get bookedMovies => _bookedMovies;

  void addBookedMovie(BookedMovie movie) {
    _bookedMovies.add(movie);
    notifyListeners();
  }
}
