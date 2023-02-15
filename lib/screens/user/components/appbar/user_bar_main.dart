import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outq_new_app/screens/user/components/drawer/user_drawer.dart';
import 'package:outq_new_app/screens/user/notifications/user_notifications.dart';
import 'package:outq_new_app/screens/user/profile/myprofile.dart';
import 'package:outq_new_app/utils/color_constants.dart';

class UserAppBar extends StatelessWidget {
  final String title;
  const UserAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white, // navigation bar color
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light),
      // leading: IconButton(
      //     icon: const Icon(
      //       Icons.location_on,
      //       color: Colors.blue,
      //       size: 30,
      //     ),
      //     onPressed: () {}),
      title: Row(
        children: [
          IconButton(
              icon: const Icon(
                Icons.location_on,
                color: Colors.blue,
                size: 30,
              ),
              onPressed: () {}),
          Text(
            'Calicut ',
            style: GoogleFonts.poppins(
              color: const Color(0xFF09041B),
              fontSize: 16,
              // height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(
            Icons.arrow_drop_down_outlined,
            size: 24,
          )
        ],
      ),
      elevation: 0,
      backgroundColor: ColorConstants.white,
      foregroundColor: Colors.black,
      // centerTitle: true,
      actions: [
        IconButton(
            icon: const Icon(
              Icons.notifications_active,
              size: 30,
            ),
            onPressed: () {
              Get.to(() => const UserNotifications());
            }),
        IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 30,
            ),
            onPressed: () {
              Get.to(() => const UserMyProfilePage());
            }),
      ],

      // Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           IconButton(
      //               icon: const Icon(
      //                 Icons.location_on,
      //                 color: Colors.blue,
      //                 size: 30,
      //               ),
      //               onPressed: () {}),
      //           Text(
      //             'Calicut, Kerala',
      //             style: GoogleFonts.poppins(
      //               color: const Color(0xFF09041B),
      //               fontSize: 16,
      //               // height: 1.5,
      //               fontWeight: FontWeight.w500,
      //             ),
      //           ),
      //         ],
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           IconButton(
      //               icon: const Icon(
      //                 Icons.notifications_active,
      //                 size: 30,
      //               ),
      //               onPressed: () {}),
      //           IconButton(
      //               icon: const Icon(
      //                 Icons.account_circle_outlined,
      //                 size: 30,
      //               ),
      //               onPressed: () {}),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
