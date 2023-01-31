import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outq_new_app/screens/shared/welcome_screen/welcome_screen.dart';
import 'package:outq_new_app/utils/color_constants.dart';

class UserAppBar extends StatelessWidget {
  final String title;
  const UserAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: 0,
      backgroundColor: ColorConstants.blue,
      centerTitle: true,
      actions: [
        IconButton(
            icon: const Icon(
              Icons.notifications,
              // color: Colors.white,
            ),
            onPressed: () {
              Get.to(() => const WelcomeScreen());
            })
      ],
    );
  }
}
