import 'package:atoz_cinema/models/cinema.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:atoz_cinema/cubits/app_bar/app_bar_cubit.dart';
import 'package:atoz_cinema/data/data.dart';
import 'package:atoz_cinema/screens/booking_screen.dart';
// import 'package:atoz_cinema/widgets/custom_app_barpay.dart';
// Correct import statement

class MovieScreen extends StatelessWidget {
  final Model mongo;
  const MovieScreen({Key? key, required this.mongo})
      : super(key: key); // Fix key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: myList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisExtent: 250,
              mainAxisSpacing: 12.0,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingScreen(
                        mode: 1,
                        mongo: mongo,
                        image_caption: '',
                        image_location: '',
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        myList[index].imageUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        myList[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
