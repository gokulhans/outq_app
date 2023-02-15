import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:outq_new_app/Backend/api/owner_api.dart';
import 'package:outq_new_app/Backend/api/user_api.dart';
import 'package:outq_new_app/screens/owner/store/edit/edit_store.dart';
import 'package:outq_new_app/screens/user/booking/booking.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_appbar.dart';
import 'package:outq_new_app/utils/sizes.dart';
import 'package:outq_new_app/utils/widget_functions.dart';

class UserViewStorePage extends StatefulWidget {
  UserViewStorePage({super.key});

  @override
  State<UserViewStorePage> createState() => _UserViewStorePageState();
}

class _UserViewStorePageState extends State<UserViewStorePage> {
  dynamic argumentData = Get.arguments;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: UserAppBarWithBack(
            title: "",
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder(
                future: getSingleStore(argumentData[0]),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container();
                    // return const Center(
                    //     child: SpinKitCircle(
                    //   color: Colors.blue,
                    //   size: 50.0,
                    // ));
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
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: double.infinity,
                                  height: 180,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1562322140-8baeececf3df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80"),
                                    ),
                                  ),
                                ),
                                addVerticalSpace(20),
                                Text(
                                  snapshot.data[i].name,
                                  style:
                                      Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  snapshot.data[i].description,
                                  style:
                                      Theme.of(context).textTheme.subtitle2,
                                ),
                                // addVerticalSpace(30),
                              ],
                            );
                          },
                        ),
                      );
                    }
                  }
                },
              ),
              FutureBuilder(
                future: getSingleStoreServices(argumentData[0]),
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
                        flex: 3,
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: tDefaultSize),
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
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        width: 100,
                                        height: 25,
                                        color: Colors.blue[700],
                                        child: Center(
                                            child: TextButton(
                                          onPressed: () {
                                            Get.to(
                                                () => const ShopBookingPage(),
                                                arguments: [
                                                  snapshot.data[i].id,
                                                  snapshot.data[i].name,
                                                ]);
                                          },
                                          child: Text(
                                            "Book",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 10,
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.w600,
                                              height: 1,
                                            ),
                                          ),
                                        )),
                                      ),
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
        ));
  }
}
