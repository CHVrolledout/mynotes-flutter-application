// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerifyView extends StatefulWidget {
  const EmailVerifyView({super.key});

  @override
  State<EmailVerifyView> createState() => _EmailVerifyViewState();
}

class _EmailVerifyViewState extends State<EmailVerifyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify Email")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("please verify your email.."),
            TextButton(
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  print(user);
                  await user?.sendEmailVerification();
                },
                child: const Text("Verify Email")),
          ],
        ),
      ),
    );
  }
}