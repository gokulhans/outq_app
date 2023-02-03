import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:outq_new_app/screens/user/chat/user_chat_list.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_bar_main.dart';
import 'package:outq_new_app/screens/user/components/drawer/user_drawer.dart';
import 'package:outq_new_app/screens/user/profile/myprofile.dart';
import 'package:outq_new_app/screens/user/service/user_service_search.dart';
import 'package:outq_new_app/utils/color_constants.dart';
import 'package:outq_new_app/utils/sizes.dart';

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
      padding: const EdgeInsets.all(tDefaultSize),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(90, 108, 234, 0.07000000029802322),
                    offset: Offset(0, 0),
                    blurRadius: 50)
              ],
              color: Colors.green,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    child:
                        Image(image: AssetImage('assets/images/Menuphoto.png')),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Herbal Pancake',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text(
                            'Herbal Pancake',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text('\$7',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline2),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
