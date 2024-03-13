// import 'package:firebase_auth/firebase_auth.dart';
import 'package:atoz_cinema/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // final _auth = FirebaseAuth.instance;
  final _user = TextEditingController();
  final _pass = TextEditingController();
  final _pass1 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bor = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none);
  void signup() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Register Sucessful '),
        ),
      );
    }
    // try {
    //   await _auth.createUserWithEmailAndPassword(
    //       email: _user.text, password: _pass.text);
    //   // ignore: use_build_context_synchronously
    //   Navigator.pop(context);
    // } on FirebaseAuthException catch (e) {
    //   // ignore: use_build_context_synchronously
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(
    //         e.message.toString(),
    //       ),
    //     ),
    //   );
    // }
  }

  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Column(
                children: <Widget>[
                  SizedBox(height: 60.0),
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    InputField(
                      user: _user,
                      bor: bor,
                      validator: (value) {
                        return null;
                      },
                      icon: Icons.person,
                      hinttext: 'Name',
                      bool1: false,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      user: _user,
                      bor: bor,
                      validator: (value) {
                        return null;
                      },
                      icon: Icons.phone,
                      hinttext: 'Phone',
                      bool1: false,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      user: _user,
                      bor: bor,
                      validator: (value) {
                        return null;
                      },
                      icon: Icons.phone,
                      hinttext: 'Adress',
                      bool1: false,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      user: _user,
                      bor: bor,
                      validator: (value) {
                        return null;
                      },
                      icon: Icons.email,
                      hinttext: 'Email',
                      bool1: false,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      user: _pass,
                      bor: bor,
                      validator: (value) {
                        return null;
                      },
                      icon: Icons.password,
                      hinttext: 'Password',
                      bool1: true,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      user: _pass1,
                      bor: bor,
                      validator: (value) {
                        return null;
                      },
                      icon: Icons.phone,
                      hinttext: 'ConfirmPassword',
                      bool1: true,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                child: ElevatedButton(
                  onPressed: signup,
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
