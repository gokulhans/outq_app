import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outq_new_app/screens/owner/home/owner_home.dart';
import 'package:outq_new_app/screens/shared/welcome_screen/welcome_screen.dart';
import 'package:outq_new_app/screens/user/home/user_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  // final String? ownerid;
  // final String? userid;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? ownerid = prefs.getString("ownerid");
      String? userid = prefs.getString("userid");
      print(ownerid);
      print(userid);
      if (ownerid != null) {
        Get.to(() => OwnerHomePage(currentIndex: 0));
      } else if (userid != null) {
        Get.to(() => const UserHomePage());
      }
      Get.to(() => const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Image(image: AssetImage("assets/app_icon/playstore.png"))
        ],
      )),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({super.key, required this.ownerid, required this.userid});

  final String? ownerid;
  final String? userid;

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (widget.ownerid != null)
          ? OwnerHomePage(currentIndex: 0)
          : (widget.userid != null)
              ? const UserHomePage()
              : const WelcomeScreen(),
    );
  }
}
