import 'package:flutter/material.dart';
import 'package:outq_new_app/utils/color_constants.dart';

class UserAppBarWithBack extends StatelessWidget {
  final String title;
  const UserAppBarWithBack({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: 3,
      backgroundColor: ColorConstants.blue,
      // centerTitle: true,
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          }),
    );
  }
}
