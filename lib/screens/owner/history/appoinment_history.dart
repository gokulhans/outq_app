import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:outq_new_app/Backend/api/owner_api.dart';
import 'package:outq_new_app/Backend/api/user_api.dart';
import 'package:outq_new_app/screens/owner/store/edit/edit_store.dart';
import 'package:outq_new_app/screens/user/booking/booking.dart';
import 'package:outq_new_app/screens/user/booking/user_view_booking.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_appbar.dart';
import 'package:outq_new_app/screens/user/service/view_service/user_view_service.dart';
import 'package:outq_new_app/utils/sizes.dart';
import 'package:outq_new_app/utils/widget_functions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OwnerAppoinmentHistoryPage extends StatefulWidget {
  const OwnerAppoinmentHistoryPage({super.key});

  @override
  State<OwnerAppoinmentHistoryPage> createState() =>
      _OwnerAppoinmentHistoryPageState();
}

class _OwnerAppoinmentHistoryPageState
    extends State<OwnerAppoinmentHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'History',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: getOwnerOrders(),
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
                    'No Booking is available right now.',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ));
                } else {
                  return Expanded(
                    flex: 3,
                    child: ListView.builder(
                      padding:
                          const EdgeInsets.symmetric(horizontal: tDefaultSize),
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () => Get.to(
                              () => const UserSingleAppoinmentInfoPage(),
                              arguments: [
                                snapshot.data[i].start,
                                snapshot.data[i].storeid,
                                snapshot.data[i].serviceid,
                                snapshot.data[i].bookingid,
                                snapshot.data[i].servicename,
                                snapshot.data[i].storename,
                              ]),
                          child: Row(
                            children: [
                              // Expanded(
                              //   flex: 2,
                              //   child: Padding(
                              //     padding: const EdgeInsets.symmetric(
                              //       vertical: 12.0,
                              //     ),
                              //     child: Container(
                              //       height: 60,
                              //       child: ClipRRect(
                              //           borderRadius:
                              //               BorderRadius.circular(12.0),
                              //           child: const Image(
                              //               image: AssetImage(
                              //                   'assets/images/userImage.png'))),
                              //     ),
                              //   ),
                              // ),
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
                                          snapshot.data[i].servicename,
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                        Text(
                                          snapshot.data[i].date,
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
                                      // color: Colors.blue[700],
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () {
                                            // Get.to(() => const ShopBookingPage(),
                                            //     arguments: [
                                            //       snapshot.data[i].id,
                                            //       snapshot.data[i].storeid,
                                            //       // snapshot.data[i].price,
                                            //       snapshot.data[i].name,
                                            //     ]);
                                          },
                                          child: snapshot.data[i].orderid ==
                                                  "Cancelled"
                                              ? Text(
                                                  snapshot.data[i].orderid,
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.red,
                                                    fontSize: 12,
                                                    letterSpacing: 0.5,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1,
                                                  ),
                                                )
                                              : Text(
                                                  snapshot.data[i].orderid,
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.green,
                                                    fontSize: 12,
                                                    letterSpacing: 0.5,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
