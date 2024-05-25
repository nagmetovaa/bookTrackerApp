import 'package:bookTracker/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/sign/sign_elements.dart';

class SignIn extends StatelessWidget {
  final VoidCallback onRegistrationComplete;

  const SignIn({Key? key, required this.onRegistrationComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleField()
      ),
      body: Center(
        child:SignElements(titleText: 'Login to an existing account',signUp: false, buttonText: 'Sign in', loginPage: true,)
      ),
    );
  }
}
