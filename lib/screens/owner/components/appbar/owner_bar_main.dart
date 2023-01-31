import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outq_new_app/screens/owner/notifications/owner_notifications.dart';
import 'package:outq_new_app/screens/user/notifications/user_notifications.dart';
import 'package:outq_new_app/utils/color_constants.dart';

class OwnerAppBar extends StatelessWidget {
  final String title;
  const OwnerAppBar({super.key, required this.title});

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
            ),
            onPressed: () {
              Get.to(() => const OwnerNotifications());
            })
      ],
    );
  }
}
