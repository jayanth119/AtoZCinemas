import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController user;
  final OutlineInputBorder bor;
  final String? Function(String?) validator;
  final String hinttext;
  final IconData icon;
  final bool bool1;
  const InputField({
    super.key,
    required this.user,
    required this.bor,
    required this.validator,
    required this.hinttext,
    required this.icon,
    required this.bool1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: bool1,
      controller: user,
      validator: validator,
      decoration: InputDecoration(
        hintText: hinttext,
        border: bor,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(
          icon,
          color: Colors.red,
        ),
      ),
    );
  }
}
