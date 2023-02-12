import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outq_new_app/Backend/api/owner_api.dart';
import 'package:outq_new_app/screens/owner/auth/forgot_psd/owner_forgot_psd.dart';
import 'package:outq_new_app/screens/owner/auth/forgot_psd/owner_reset_password.dart';
import 'package:outq_new_app/screens/owner/auth/otp/owner_otp.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_bar_main.dart';
import 'package:outq_new_app/screens/owner/components/drawer/owner_drawer.dart';
import 'package:outq_new_app/screens/owner/profile/settings/settings.dart';
import 'package:outq_new_app/screens/owner/service/view/owner_view_service.dart';
import 'package:outq_new_app/screens/owner/store/create/create_store.dart';
import 'package:get/get.dart';
import 'package:outq_new_app/screens/owner/service/create/create_service.dart';
import 'package:outq_new_app/screens/owner/service/edit/edit_service.dart';
import 'package:outq_new_app/screens/owner/store/edit/edit_store.dart';
import 'package:outq_new_app/screens/owner/store/view/owner_view_store.dart';
import 'package:outq_new_app/screens/owner/success/success.dart';
import 'package:outq_new_app/utils/sizes.dart';
import 'package:http/http.dart' as http;

class OwnerHomePage extends StatefulWidget {
  const OwnerHomePage({super.key});

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  int currentIndex = 0;
  List tabScreens = const [
    OwnerHomeScreen(),
    OwnerViewStorePage(),
    OwnerViewServicePage(),
    OwnerViewSettingsPage(),
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

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({super.key});
  @override
  State<OwnerHomeScreen> createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: Colors.white,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder(
            future: getOwnerStore(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: Placeholder(
                    color: Colors.green,
                  ),
                );
              } else {
                if (snapshot.data.length == 0) {
                  return const Center(
                      child: Text(
                    'No Content is available right now.\nWe will Update it with in august 31.',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ));
                } else {
                  return Expanded(
                    flex: 2,
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return Container(
                              height: 150,
                              padding: const EdgeInsets.only(right: 60),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[i].name,
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  Text(
                                    snapshot.data[i].description,
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                ],
                              ),
                            );
                          }));
                }
              }
            },
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hair Cleaning ',
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                'Arun',
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ]),
                        Text(
                          "10.00",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700, color: Colors.blue),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
