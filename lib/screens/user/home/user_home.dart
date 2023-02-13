import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outq_new_app/Backend/api/owner_api.dart';
import 'package:outq_new_app/Backend/api/user_api.dart';
import 'package:outq_new_app/screens/user/chat/user_chat_list.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_bar_main.dart';
import 'package:outq_new_app/screens/user/components/drawer/user_drawer.dart';
import 'package:outq_new_app/screens/user/profile/myprofile.dart';
import 'package:outq_new_app/screens/user/service/all_service/user_service_search.dart';
import 'package:outq_new_app/screens/user/service/view_service/user_view_service.dart';
import 'package:outq_new_app/screens/user/store/view_store/user_view_store.dart';
import 'package:outq_new_app/utils/color_constants.dart';
import 'package:outq_new_app/utils/sizes.dart';
import 'package:outq_new_app/utils/widget_functions.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    // Center(child: UserChatListPage()),
    // Center(child: UserMyProfilePage()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: UserAppBar(
          title: "OutQ",
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
              icon: Icon(Icons.sell),
              label: 'Offers',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.chat),
            //   label: 'Messages',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: 'Profile',
            // ),
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
        // padding: const EdgeInsets.symmetric(horizontal: tDefaultSize),
        color: Colors.white,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(
            //   width: double.infinity,
            //   height: 50,
            //   // padding: const EdgeInsets.only(right: 80),
            //   child: Text(
            //     'Welcome To OutQ',
            //     textAlign: TextAlign.left,
            //     style: Theme.of(context).textTheme.headline3,
            //   ),
            // ),
            // addVerticalSpace(20),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         width: 150,
            //         height: 100,
            //         padding: const EdgeInsets.all(2.0),
            //         decoration: BoxDecoration(
            //           boxShadow: const [
            //             BoxShadow(
            //               color: Colors.black26,
            //               blurRadius: 10.0,
            //               offset: Offset(0.0, 3.0),
            //             ),
            //           ],
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             const Icon(
            //               Icons.calendar_month_outlined,
            //               size: 42,
            //               color: Colors.black87,
            //             ),
            //             Text(
            //               "Appointment",
            //               textAlign: TextAlign.center,
            //               style: GoogleFonts.poppins(
            //                 fontWeight: FontWeight.w700,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         width: 150,
            //         height: 100,
            //         padding: const EdgeInsets.all(2.0),
            //         decoration: BoxDecoration(
            //           boxShadow: const [
            //             BoxShadow(
            //               color: Colors.black26,
            //               blurRadius: 10.0,
            //               offset: Offset(0.0, 3.0),
            //             ),
            //           ],
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             const Icon(
            //               Icons.directions_bus,
            //               size: 42,
            //               color: Colors.black87,
            //             ),
            //             Text(
            //               "Track Bus",
            //               textAlign: TextAlign.center,
            //               style: GoogleFonts.poppins(
            //                 fontWeight: FontWeight.w700,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       // Container(
            //       //   width: 150,
            //       //   height: 90,
            //       //   padding: const EdgeInsets.all(2.0),
            //       //   decoration: BoxDecoration(
            //       //     boxShadow: const [
            //       //       BoxShadow(
            //       //         color: Colors.black26,
            //       //         blurRadius: 10.0,
            //       //         offset: Offset(0.0, 3.0),
            //       //       ),
            //       //     ],
            //       //     color: Colors.white,
            //       //     borderRadius: BorderRadius.circular(10.0),
            //       //   ),
            //       //   child: Container(
            //       //     child: Text(
            //       //       "Track Bus",
            //       //       style: Theme.of(context).textTheme.subtitle1,
            //       //     ),
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 30,
                          ),
                          onPressed: () {}),
                      Text(
                        'Calicut, Kerala',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF09041B),
                          fontSize: 16,
                          // height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.notifications_active,
                            size: 30,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: const Icon(
                            Icons.account_circle_outlined,
                            size: 30,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
            addHorizontalSpace(20),
            Container(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      color: Colors.blue[800],
                      child: Center(
                        child: InkWell(
                          focusColor: Colors.green,
                          onTap: () {},
                          child: Text(
                            'SALOON',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              // height: 1.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      color: Colors.blue,
                      child: Center(
                        child: InkWell(
                          focusColor: Colors.green,
                          onTap: () {},
                          child: Text(
                            'BUSES',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              // height: 1.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      color: Colors.blue,
                      child: Center(
                        child: InkWell(
                          focusColor: Colors.green,
                          onTap: () {},
                          child: Text(
                            'TURF',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              // height: 1.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      color: Colors.blue,
                      child: Center(
                        child: InkWell(
                          focusColor: Colors.green,
                          onTap: () {},
                          child: Text(
                            'PETS',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              // height: 1.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: tDefaultSize),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[100],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 14),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12.0),
                child: ListView(
                  children: [
                    CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1562322140-8baeececf3df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1562322140-8baeececf3df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //3rd Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1562322140-8baeececf3df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //4th Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1562322140-8baeececf3df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //5th Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: NetworkImage("ADD IMAGE URL HERE"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: tDefaultSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nearest Services',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF09041B),
                      fontSize: 20,
                      // height: 1.5,
                      fontWeight: FontWeight.w600,
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
            ),
            addVerticalSpace(20),
            FutureBuilder(
              future: getAllStores(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                      child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: SpinKitCircle(
                      color: Colors.blue,
                      size: 50.0,
                    ),
                  ));
                } else {
                  if (snapshot.data.length == 0) {
                    return const Center(
                        child: Text(
                      'No Content is available right now.',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ));
                  } else {
                    return Expanded(
                      flex: 2,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          return Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/images/userImage.png'))),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data[i].name,
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                        Text(
                                          snapshot.data[i].name,
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        // Text('\$7',
                                        //     textAlign: TextAlign.left,
                                        //     style: Theme.of(context)
                                        //         .textTheme
                                        //         .headline5),
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
                                        begin: Alignment(0.8459399938583374,
                                            0.1310659646987915),
                                        end: Alignment(-0.1310659646987915,
                                            0.11150387674570084),
                                        colors: [
                                          Color.fromRGBO(83, 130, 231, 1),
                                          Color.fromRGBO(20, 130, 231, 1)
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                        child: TextButton(
                                      onPressed: () {
                                        Get.to(() => UserViewStorePage(),
                                            arguments: [
                                              snapshot.data[i].type,
                                              snapshot.data[i].name
                                            ]);
                                      },
                                      child: Text(
                                        "View",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 12,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w500,
                                          height: 1,
                                        ),
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class SingleServiceListTile extends StatelessWidget {
//   const SingleServiceListTile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
