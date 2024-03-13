import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: const Image(
      //     image: AssetImage('assets/images/spongbob.jpg'),
      //     fit: BoxFit.cover,
      //   ),
      //   backgroundColor: Colors.transparent,
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/spongbob.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
