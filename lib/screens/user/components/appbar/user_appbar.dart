import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:outq_new_app/utils/color_constants.dart';

class UserAppBarWithBack extends StatelessWidget {
  final String title;
  const UserAppBarWithBack({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          // systemNavigationBarColor: Colors.white, // navigation bar color
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light),
      title: Text(title),
      elevation: 0,
      backgroundColor: ColorConstants.white,
      foregroundColor: Colors.black,
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
