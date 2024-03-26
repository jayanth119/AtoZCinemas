import 'package:atoz_cinema/widgets/pay_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atoz_cinema/screens/screens.dart';
import 'package:atoz_cinema/screens/home_screen.dart' as pd;
import 'package:atoz_cinema/screens/searchpage.dart' as sd;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => pd.Flow()),
        ChangeNotifierProvider(create: (_) => sd.MovieFlow()),
        ChangeNotifierProvider(create: (_) => BookedMoviesProvider())
        // Add other providers here if needed
      ],
      child: MaterialApp(
        title: 'AtoZ cinema ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: NavScreen(),
      ),
    );
  }
}
