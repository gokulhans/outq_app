import 'package:flutter/material.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_bar_main.dart';
import 'package:outq_new_app/screens/owner/components/drawer/owner_drawer.dart';
import 'package:outq_new_app/screens/user/components/drawer/user_drawer.dart';

class OwnerHomePage extends StatefulWidget {
  const OwnerHomePage({super.key});

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  int currentIndex = 0;
  List tabScreens = [
    Center(child: Text("Out 1")),
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
