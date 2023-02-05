import 'package:flutter/material.dart';
import 'package:outq_new_app/screens/owner/auth/forgot_psd/owner_forgot_psd.dart';
import 'package:outq_new_app/screens/owner/auth/forgot_psd/owner_reset_password.dart';
import 'package:outq_new_app/screens/owner/auth/otp/owner_otp.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_bar_main.dart';
import 'package:outq_new_app/screens/owner/components/drawer/owner_drawer.dart';
import 'package:outq_new_app/screens/owner/store/create/create_store.dart';
import 'package:get/get.dart';
import 'package:outq_new_app/screens/owner/service/create/create_service.dart';
import 'package:outq_new_app/screens/owner/service/edit/edit_service.dart';
import 'package:outq_new_app/screens/owner/store/edit/edit_store.dart';
import 'package:outq_new_app/screens/owner/success/success.dart';

class OwnerHomePage extends StatefulWidget {
  const OwnerHomePage({super.key});

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  int currentIndex = 0;
  List tabScreens = const [
    OwnerHomeScreen(),
    Center(child: Text("Out 2")),
    Center(child: Text("Out 3")),
    Center(child: Text("Out 4")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: OwnerAppBar(
          title: "Owner Home",
        ),
      ),
      drawer: const OwnerDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          unselectedLabelStyle: TextStyle(
            color: Colors.blueGrey[50],
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          selectedLabelStyle: const TextStyle(
            color: Colors.blue,
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
              icon: Icon(Icons.store),
              label: 'Store',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.design_services_outlined),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ]),
      body: tabScreens.elementAt(currentIndex),
    );
  }
}


class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Column(
            children: [
              TextButton(
                onPressed: () {
                  Get.to(() => const CreateStorePage());
                },
                child: const Text("Create Store"),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const EditStorePage());
                },
                child: const Text("Edit Store"),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const CreateServicePage());
                },
                child: const Text("Create Service"),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const EditServicePage());
                },
                child: const Text("Edit Service"),
              ),
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
              TextButton(
                onPressed: () {
                  Get.to(() => const SuccessPage());
                },
                child: const Text("Success"),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const OwnerOtpPage());
                },
                child: const Text("OwnerOtpPage"),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const OwnerForgotPsdPage());
                },
                child: const Text("OwnerForgotPsdPage"),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const OwnerResetPsdPage());
                },
                child: const Text("OwnerResetPsdPage"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
