import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outq_new_app/screens/owner/service/edit/edit_service.dart';
import 'package:outq_new_app/screens/user/chat/user_chat_list.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_bar_main.dart';
import 'package:outq_new_app/screens/user/components/drawer/user_drawer.dart';
import 'package:outq_new_app/screens/user/profile/myprofile.dart';
import 'package:outq_new_app/screens/user/service/user_service_search.dart';
import 'package:outq_new_app/utils/color_constants.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int currentIndex = 0;
  List tabScreens = const [
    Center(child: UserHomeScreen()),
    Center(child: UserServiceSearchPage()),
    Center(child: UserChatListPage()),
    Center(child: UserMyProfilePage()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: UserAppBar(
          title: "User Home",
        ),
      ),
      drawer: const UserDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          unselectedLabelStyle: TextStyle(
            color: Colors.blueGrey[50],
          ),
          selectedIconTheme: IconThemeData(
            color: ColorConstants.blue,
          ),
          selectedLabelStyle: TextStyle(
            color: ColorConstants.blue,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.blueGrey[200],
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 25,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.design_services_outlined),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
      body: tabScreens.elementAt(currentIndex),
    );
  }
}

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              Get.to(() => const EditServicePage());
            },
            child: const Text("View Service"),
          ),
          TextButton(
            onPressed: () {
              Get.to(() => const EditServicePage());
            },
            child: const Text("View Store"),
          ),
        ],
      ),
    );
  }
}
