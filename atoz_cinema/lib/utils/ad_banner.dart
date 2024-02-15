import 'package:flutter/material.dart';

class AddBanner extends StatelessWidget {
  const AddBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10,
      color: Colors.redAccent,
      child: const Text('To Disply Ad '),
    );
  }
}
