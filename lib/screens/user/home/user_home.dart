import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outq_new_app/screens/owner/service/edit/edit_service.dart';
import 'package:outq_new_app/screens/user/chat/user_chat_list.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_bar_main.dart';
import 'package:outq_new_app/screens/user/components/drawer/user_drawer.dart';
import 'package:outq_new_app/screens/user/profile/myprofile.dart';
import 'package:outq_new_app/screens/user/service/user_service_search.dart';
import 'package:outq_new_app/utils/color_constants.dart';
import 'package:outq_new_app/utils/sizes.dart';
import 'package:outq_new_app/utils/widget_functions.dart';

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
          title: "",
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
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: tDefaultSize),
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                // padding: const EdgeInsets.only(right: 80),
                child: Text(
                  'Welcome To OutQ',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              addVerticalSpace(20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 100,
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 3.0),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            size: 42,
                            color: Colors.black87,
                          ),
                          Text(
                            "Appointment",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 100,
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 3.0),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.directions_bus,
                            size: 42,
                            color: Colors.black87,
                          ),
                          Text(
                            "Track Bus",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   width: 150,
                    //   height: 90,
                    //   padding: const EdgeInsets.all(2.0),
                    //   decoration: BoxDecoration(
                    //     boxShadow: const [
                    //       BoxShadow(
                    //         color: Colors.black26,
                    //         blurRadius: 10.0,
                    //         offset: Offset(0.0, 3.0),
                    //       ),
                    //     ],
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //   child: Container(
                    //     child: Text(
                    //       "Track Bus",
                    //       style: Theme.of(context).textTheme.subtitle1,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              addVerticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nearest Services',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF09041B),
                      fontSize: 15,
                      // height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'View More',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFFF7B32),
                      fontSize: 12,
                      // height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              addVerticalSpace(20),
              const SingleServiceListTile(),
              const SingleServiceListTile(),
              const SingleServiceListTile(),
              const SingleServiceListTile(),
              const SingleServiceListTile(),
              const SingleServiceListTile(),
              const SingleServiceListTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleServiceListTile extends StatelessWidget {
  const SingleServiceListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: const Image(
                    image: AssetImage('assets/images/userImage.png'))),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Herbal Pancake',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    'Herbal Pancake',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text('\$7',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline5),
                ]),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: 100,
              height: 25,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17.5),
                  topRight: Radius.circular(17.5),
                  bottomLeft: Radius.circular(17.5),
                  bottomRight: Radius.circular(17.5),
                ),
                gradient: LinearGradient(
                  begin: Alignment(0.8459399938583374, 0.1310659646987915),
                  end: Alignment(-0.1310659646987915, 0.11150387674570084),
                  colors: [
                    Color.fromRGBO(83, 130, 231, 1),
                    Color.fromRGBO(20, 130, 231, 1)
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  'Book',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
