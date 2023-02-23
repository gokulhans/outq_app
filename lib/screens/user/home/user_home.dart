import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outq_new_app/screens/user/booking/booking.dart';
import 'package:outq_new_app/screens/user/booking/view-booking.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_bar_main.dart';
import 'package:outq_new_app/screens/user/search/user_search.dart';
import 'package:outq_new_app/screens/user/store/view_store/user_view_store.dart';
import 'package:outq_new_app/utils/color_constants.dart';
import 'package:outq_new_app/utils/constants.dart';
import 'package:outq_new_app/utils/widget_functions.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String? userlocation;
String? userlongitude;
String? userlatitude;
String? userpincode;
bool isVisible = true;



Future updateuser(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userid = prefs.getString("userid") ?? "null";

  http.post(
      Uri.parse(
        "${apidomain}auth/user/update/$userid",
      ),
      headers: <String, String>{
        'Context-Type': 'application/json; charset=UTF-8',
      },
      body: <String, String>{
        'location': userlocation ?? "",
        'pincode': userpincode ?? "",
        'longitude': userlongitude ?? "",
        'latitude': userlatitude ?? "",
      });

  // if (response.statusCode == 201) {
  //   var jsonData = jsonDecode(response.body);
  //   print(jsonData);
  //   print(jsonData["success"]);
  //   if (jsonData["success"]) {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (BuildContext context) => OwnerExithome()),
  //         (Route<dynamic> route) => false);
  //   }
  // }
}

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  String _currentAddress = "";
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:
                Text('Location permissions are denied. Enable to Continue')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) {
      Geolocator.openLocationSettings();
    }
    // return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      print(place.country);
      setState(() {
        _currentAddress =
            '${place.administrativeArea}, ${place.locality}, ${place.thoroughfare}, ${place.postalCode}';
      });
      print({_currentAddress, _currentPosition});
      userlocation = _currentAddress;
      userlongitude = _currentPosition!.longitude.toString();
      userlatitude = _currentPosition!.latitude.toString();
      userpincode = place.postalCode.toString();
      updateuser(context);
      isVisible = true;
      setState(() {});
      print("object");
      print(isVisible);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  int currentIndex = 0;
  List tabScreens = [
    const Center(child: UserHomeScreen()),
    // Center(child: UserSearchServicesPage()),
    const Center(child: UserViewBookingsPage()),
    // Center(child: UserServiceSearchPage()),
    // Center(child: UserChatListPage()),
    // Center(child: UserMyProfilePage()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: UserAppBar(
          title: _currentAddress,
        ),
      ),
      // drawer: const UserDrawer(),
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
          iconSize: 20,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.search),
            //   label: 'Search',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.watch),
              label: 'My Appoinments',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: 'Profile',
            // ),
          ]),
      body: tabScreens.elementAt(currentIndex),
      // body: const UserHomeScreen(),
    );
  }
}

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  var query;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      child: isVisible
          ? SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    addVerticalSpace(10),
                    Container(
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (val) {
                              setState(() {
                                query = val;
                                print(query);
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 14),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(() => const UserSearchServicesPage(),
                                    arguments: [query]);
                              },
                              child: const Text("Search")),
                        ],
                      ),
                    ),
                    // addVerticalSpace(20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Near By Offers',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF09041B),
                              fontSize: 18,

                              // height: 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // TextButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       'View More',
                          //       style: GoogleFonts.poppins(
                          //         color: const Color(0xFFFF7B32),
                          //         fontSize: 12,
                          //         // height: 1.5,
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ))
                        ],
                      ),
                    ),
                    addVerticalSpace(20),
                    FutureBuilder(
                      future: http.get(Uri.parse('${apidomain}service/getall')),
                      builder: (BuildContext context,
                          AsyncSnapshot<http.Response> snapshot) {
                        if (snapshot.hasData) {
                          var data = jsonDecode(snapshot.data!.body);
                          print(data);
                          return SizedBox(
                            height: 180,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: data
                                  .length, // Replace with the actual number of items in your list
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: (() => {
                                        Get.to(() => const ShopBookingPage(),
                                            arguments: [
                                              data[index]['ownerid'],
                                              data[index]['type'],
                                              data[index]['storeid'],
                                              data[index]['name'],
                                              data[index]['price'],
                                              data[index]['storename'],
                                              data[index]['start'],
                                              data[index]['end'],
                                              data[index]['img'],
                                            ])
                                      }),
                                  child: SizedBox(
                                    width: 150,
                                    height: 200,
                                    child: Card(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                    top: Radius.circular(16)),
                                            child: Image.network(
                                              data[index]['img'],
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          addVerticalSpace(10),
                                          Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data[index]['name'],
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                addVerticalSpace(5),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "${data[index]['price']} ₹",
                                                      // data[index]['location'],
                                                      style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              Colors.red[900]),
                                                    ),
                                                    addHorizontalSpace(5),
                                                    Text(
                                                      "${data[index]['ogprice']} ₹",
                                                      // data[index]['location'],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .green[900]),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                    addVerticalSpace(20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Near By Stores',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF09041B),
                              fontSize: 18,
                              // height: 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // TextButton(
                          //     onPressed: () {},
                          //     child: Text(
                          //       'View More',
                          //       style: GoogleFonts.poppins(
                          //         color: const Color(0xFFFF7B32),
                          //         fontSize: 12,
                          //         // height: 1.5,
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ))
                        ],
                      ),
                    ),
                    addVerticalSpace(20),
                    FutureBuilder(
                      future:
                          http.get(Uri.parse('${apidomain}store/store/get')),
                      builder: (BuildContext context,
                          AsyncSnapshot<http.Response> snapshot) {
                        if (snapshot.hasData) {
                          var data = jsonDecode(snapshot.data!.body);
                          print(data);
                          return SizedBox(
                            height: 200,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => const UserViewStorePage(),
                                        arguments: [
                                          data[index]['type'],
                                          data[index]['name'],
                                          data[index]['start'],
                                          data[index]['end']
                                        ]);
                                  },
                                  child: SizedBox(
                                    width: 150,
                                    height: 200,
                                    child: Card(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                    top: Radius.circular(16)),
                                            child: Image.network(
                                              data[index]['img'],
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          addVerticalSpace(10),
                                          Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data[index]['name'],
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                addVerticalSpace(5),
                                                Text(
                                                  "5 star",
                                                  // data[index]['location'],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.yellow[900]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                    addVerticalSpace(20),
                  ],
                ),
              ),
            )
          : const SpinKitCircle(
              color: Colors.blue,
              size: 50.0,
            ),
    );
  }
}
