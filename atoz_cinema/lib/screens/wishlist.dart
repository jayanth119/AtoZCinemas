import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/pay_button.dart';

class BookMarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Booked Movies",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Consumer<BookedMoviesProvider>(
        builder: (context, provider, _) => ListView.builder(
          itemCount: provider.bookedMovies.length,
          itemBuilder: (context, index) {
            BookedMovie movie = provider.bookedMovies[index];
            return ListTile(
              onTap: () {},
              title: Text('${movie.movieName} - ${movie.selectedDate}'),
              subtitle: Text(
                  'Time: ${movie.selectedTime} | Seats: ${movie.selectedSeats}'),
              trailing: Text('\$${movie.amount}'),
              tileColor: Colors.black,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              dense: true,
              textColor: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
