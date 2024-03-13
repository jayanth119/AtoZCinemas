import 'package:atoz_cinema/widgets/edit_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/kakegurui.jpg'),
              child: Icon(Icons.data_array),
            ),
            const SizedBox(height: 20),
            editProfile('Name', CupertinoIcons.person),
            const SizedBox(height: 10),
            editProfile('Phone', CupertinoIcons.phone),
            const SizedBox(height: 10),
            editProfile('Address', CupertinoIcons.location),
            const SizedBox(height: 10),
            editProfile('Email', CupertinoIcons.mail),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  'Save ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
