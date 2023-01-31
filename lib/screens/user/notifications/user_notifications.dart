import 'package:flutter/material.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_appbar.dart';

class UserNotifications extends StatelessWidget {
  const UserNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: UserAppBarWithBack(
          title: "Notifications",
        ),
      ),
      body: Center(
        child: Text("User Notifications"),
      ),
    );
  }
}
