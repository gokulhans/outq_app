import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outq_new_app/screens/shared/exit_pop/exit_pop_up.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_appbar.dart';
import 'package:outq_new_app/utils/widget_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserMyProfilePage extends StatefulWidget {
  const UserMyProfilePage({super.key});

  @override
  State<UserMyProfilePage> createState() => _UserMyProfilePageState();
}

class _UserMyProfilePageState extends State<UserMyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: UserAppBarWithBack(
          title: "Profile",
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Container(
            //       width: 120,
            //       height: 120,
            //       decoration: const BoxDecoration(
            //         shape: BoxShape.circle,
            //         image: DecorationImage(
            //           image: AssetImage('assets/images/userImage.png'),
            //           fit: BoxFit.contain,
            //         ),
            //       ),
            //       child: Hero(
            //         tag: 'userProfile',
            //         child: Material(
            //           color: Colors.transparent,
            //           child: InkWell(
            //             onTap: () {},
            //           ),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(height: 20),
            //     const Text(
            //       'John Doe',
            //       style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     const SizedBox(height: 10),
            //     const Text(
            //       'johndoe@example.com',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w500,
            //       ),
            //     ),
            //   ],
            // ),
            addVerticalSpace(20),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.home_rounded),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.remove("userid");
                      Get.offAll(() => const Exithome());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
