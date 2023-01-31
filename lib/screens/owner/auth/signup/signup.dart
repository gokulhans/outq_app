import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outq_new_app/screens/shared/welcome_screen/welcome_screen.dart';

class OwnerSignUpPage extends StatelessWidget {
  const OwnerSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Owner SignUp",
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const WelcomeScreen());
              },
              child: const Text("Welcome"))
        ],
      )),
    );
  }
}
