import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:outq_new_app/Backend/api/user_api.dart';
import 'package:outq_new_app/Backend/models/user_models.dart';
import 'package:outq_new_app/screens/shared/exit_pop/exit_pop_up.dart';
import 'package:outq_new_app/screens/user/booking/success_booked.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_appbar.dart';
import 'package:outq_new_app/utils/color_constants.dart';
import 'package:outq_new_app/utils/constants.dart';
import 'package:outq_new_app/utils/sizes.dart';
import 'package:outq_new_app/utils/widget_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

bool isLoading = false;

Future save(BuildContext context) async {
  dynamic argumentData = Get.arguments;
  SharedPreferences pref = await SharedPreferences.getInstance();
  String userid = pref.getString("userid") ?? "null";
  if (userid == "null") {
    Get.to(() => const Exithome());
  }

  getTimeSlots(argumentData[2], booking.date);
  // print({booking.start});
  final response = await http.post(
      Uri.parse(
        "${apidomain}booking/book",
      ),
      headers: <String, String>{
        'Context-Type': 'application/json; charset=UTF-8',
      },
      body: <String, String>{
        'start': booking.start,
        'end': booking.end,
        'storeid': booking.storeid,
        'serviceid': booking.serviceid,
        'userid': userid,
        'price': booking.price,
        'date': booking.date,
        'servicename': argumentData[3],
        'storename': argumentData[5],
        'img': argumentData[8],
        'username': userid,
      });
  // print(response);
  var jsonData = jsonDecode(response.body);
  // print(jsonData["success"]);
  if (jsonData["success"]) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Slot Successfully Booked')));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) => const AppointmentBooked()),
        (Route<dynamic> route) => false);
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Slot Already Booked')));
    isLoading = false;
  }
}

BookingModel booking = BookingModel('', '', '', '', '', '', '', '', '', '', '');

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.width,
      required this.title,
      required this.onPressed,
      required this.disable})
      : super(key: key);

  final double width;
  final String title;
  final bool disable; //this is used to disable button
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        // width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          onPressed: disable ? null : onPressed,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ShopBookingPage extends StatefulWidget {
  const ShopBookingPage({Key? key}) : super(key: key);

  @override
  State<ShopBookingPage> createState() => _ShopBookingPageState();
}

class _ShopBookingPageState extends State<ShopBookingPage> {
  dynamic argumentData = Get.arguments;

  //declaration
  final CalendarFormat _format = CalendarFormat.month;
  final DateTime _focusDay = DateTime.now();
  final DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  final bool _isWeekend = false;
  final bool _dateSelected = false;
  final bool _timeSelected = false;
  String? token; //get token for insert booking date and time into database

  // Time
  // TimeOfDay selectedTime = TimeOfDay.now();
  // Future<void> _selectTime(BuildContext context) async {
  //   final TimeOfDay? picked_s = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //   );

  //   if (picked_s != null && picked_s != selectedTime)
  //     setState(() {
  //       selectedTime = picked_s;
  //       final localizations = MaterialLocalizations.of(context);
  //       final formattedTimeOfDay = localizations.formatTimeOfDay(selectedTime);
  //       booking.start = formattedTimeOfDay;
  //       booking.end = formattedTimeOfDay;
  //       // // print(booking.date);
  //     });
  // }

  // Future<void> getToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   token = prefs.getString('token') ?? '';
  // }

  // @override
  // void initState() {
  //   getToken();
  //   super.initState();
  // }

  late Future<dynamic> _future;
  @override
  void initState() {
    super.initState();
    _future = getTimeSlots(argumentData[2], DateTime.now());
    // print(DateTime.now());
  }

  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectBookingTime(BuildContext context) async {
    final TimeOfDay? pickedS = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedS != null && pickedS != selectedTime) {
      setState(() {
        selectedTime = pickedS;
        final localizations = MaterialLocalizations.of(context);
        final formattedTimeOfDay = localizations.formatTimeOfDay(selectedTime);
        var start = formattedTimeOfDay;
        booking.start = start;
        // print(start);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic argumentData = Get.arguments;
    // int start = 12 - int.parse(argumentData[6]);
    // int end = int.parse(argumentData[7]);
    // int hours = start + end + 1;
    // Config().init(context);
    // final doctor = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: UserAppBarWithBack(
          title: argumentData[3],
        ),
      ),
      // floatingActionButton:
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: tDefaultSize),
          color: Colors.white,
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(argumentData[2]),
                      // addVerticalSpace(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          'Select Date',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      // addVerticalSpace(10),
                      HorizontalCalendar(
                        date: DateTime.now(),
                        textColor: Colors.black45,
                        backgroundColor: Colors.white,
                        selectedColor: Colors.blue,
                        showMonth: true,
                        onDateSelected: (date) {
                          // // print(argumentData);
                          booking.date = date.toString();
                          // print(booking.date);
                          Get.to(() => const ShopBookingPage());
                          setState(() {
                            _future =
                                getTimeSlots(booking.storeid, booking.date);
                          });
                        },
                      ),
                      addVerticalSpace(30),

                      // addVerticalSpace(30),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       _selectTime(context);
                      //     },
                      //     child: const Text('Choose Time'),
                      //   ),
                      // ),

                      addVerticalSpace(20),
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 10),
                      //   child: Text(
                      //     'Already Booked Time',
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 20,
                      //     ),
                      //   ),
                      // ),
                      // addVerticalSpace(10),
                      // FutureBuilder(
                      //   future: _future,
                      //   builder: (context, AsyncSnapshot snapshot) {
                      //     if (snapshot.data == null) {
                      //       return const Center(
                      //           child: SpinKitCircle(
                      //         color: Colors.blue,
                      //         size: 50.0,
                      //       ));
                      //     } else {
                      //       if (snapshot.data.length == 0) {
                      //         return const Padding(
                      //           padding: EdgeInsets.all(24.0),
                      //           child: Center(
                      //               child: Text(
                      //             'No Appoinment Found Today',
                      //             style: TextStyle(
                      //               fontWeight: FontWeight.w800,
                      //               color: Colors.red,
                      //             ),
                      //           )),
                      //         );
                      //       } else {
                      //         return SizedBox(
                      //           height: 150,
                      //           child: Center(
                      //             child: GridView.builder(
                      //                 // physics:
                      //                 //     const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                      //                 shrinkWrap: true,
                      //                 gridDelegate:
                      //                     const SliverGridDelegateWithFixedCrossAxisCount(
                      //                         crossAxisCount: 3,
                      //                         childAspectRatio: 2.8),
                      //                 itemCount: snapshot.data.length,
                      //                 itemBuilder:
                      //                     (BuildContext context, int index) {
                      //                   return InkWell(
                      //                     splashColor: Colors.transparent,
                      //                     onTap: () {
                      //                       // setState(() {
                      //                       //   // print(
                      //                       //       "${index + 9}:${30} ${index + 9 > 11 ? "PM" : "AM"}");
                      //                       //   _currentIndex = index;
                      //                       //   _timeSelected = true;
                      //                       // });
                      //                     },
                      //                     child: Container(
                      //                       height: 50,
                      //                       margin: const EdgeInsets.all(5),
                      //                       decoration: BoxDecoration(
                      //                         border: Border.all(
                      //                           color: _currentIndex == index
                      //                               ? Colors.white
                      //                               : Colors.white,
                      //                         ),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                         color: Colors.red,
                      //                       ),
                      //                       alignment: Alignment.center,
                      //                       child: Text(
                      //                         snapshot.data[index].start +
                      //                             " to " +
                      //                             snapshot.data[index].end,
                      //                         style: TextStyle(
                      //                             fontSize: 8,
                      //                             fontWeight: FontWeight.bold,
                      //                             color: _currentIndex == index
                      //                                 ? Colors.white
                      //                                 : Colors.white),
                      //                       ),
                      //                     ),
                      //                   );
                      //                 }),
                      //           ),
                      //         );
                      //       }
                      //     }
                      //   },
                      // ),
                      // addVerticalSpace(30),
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 10),
                      //   child: Text(
                      //     'Select Your Time',
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 20,
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   height: 80,
                      //   // padding: const EdgeInsets.symmetric(vertical: 12.0),
                      //   clipBehavior: Clip.antiAlias,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(22),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       TextButton(
                      //         onPressed: () {
                      //           _selectBookingTime(context);
                      //         },
                      //         child: Container(
                      //           color: Colors.blue,
                      //           child: const Padding(
                      //             padding: EdgeInsets.all(8.0),
                      //             child: Text(
                      //               'Chose Booking Time',
                      //               style: TextStyle(color: Colors.white),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Text(
                      //         booking.start,
                      //         style: Theme.of(context).textTheme.subtitle1,
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // addVerticalSpace(30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Book Your Time',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      addVerticalSpace(20),

                      FutureBuilder(
                        future: _future,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return const Center(
                                child: SpinKitCircle(
                              color: Colors.blue,
                              size: 50.0,
                            ));
                          } else {
                            if (snapshot.data.length == 0) {
                              return const Padding(
                                padding: EdgeInsets.all(24.0),
                                child: Center(
                                    child: Text(
                                  'No Appoinment Found Today',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.red,
                                  ),
                                )),
                              );
                            } else {
                              return Container(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      alignment: Alignment.center,
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            border: Border.all(
                                              color: Colors.blue,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          width: 100,
                                          child: const Text(
                                            '10.00 AM',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                                          shrinkWrap: true,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  childAspectRatio: 2.5),
                                          itemCount: 6,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                booking.start = "10:00 AM";
                                                // print(booking.start);
                                                setState(() {
                                                  _currentIndex = index;
                                                  // _timeSelected = true;
                                                });
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        _currentIndex == index
                                                            ? Colors.white
                                                            : Colors.black,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: _currentIndex == index
                                                      ? Colors.blue
                                                      : null,
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '10 AM',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        _currentIndex == index
                                                            ? Colors.white
                                                            : null,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        },
                      ),

                      addVerticalSpace(30),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Store',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              // width: 100,
                              // height: 25,
                              // color: Colors.blue[700],
                              child: Center(
                                  child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  argumentData[5],
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.poppins(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Service',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              // width: 100,
                              // height: 25,
                              // color: Colors.blue[700],
                              child: Center(
                                  child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  argumentData[3],
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.poppins(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              // width: 100,
                              // height: 25,
                              // color: Colors.blue[700],
                              child: Center(
                                  child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  argumentData[4],
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.poppins(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                      addVerticalSpace(20),
                      Center(
                        child: Container(
                          width: 150,
                          height: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                ColorConstants.bluegradient1,
                                ColorConstants.bluegradient2
                              ],
                              transform: const GradientRotation(9 * pi / 180),
                            ),
                          ),
                          child: Center(
                            child: TextButton(
                              child:
                                  // isLoading ?
                                  // const Center(
                                  //     child: SizedBox(
                                  //       height: 15,
                                  //       width: 15,
                                  //       child: CircularProgressIndicator(
                                  //         strokeWidth: 3,
                                  //         color: Colors.white,
                                  //       ),
                                  //     ),
                                  //   )
                                  Text(
                                "Book",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                // print('booking 1');
                                // print(booking);
                                // print({
                                //   booking.serviceid,
                                //   booking.storeid,
                                //   booking.price,
                                //   booking.img
                                // });
                                // print('booking 2');
                                // print({argumentData[0], argumentData[2]});
                                // print('booking 3');
                                booking.serviceid = argumentData[0];
                                booking.storeid = argumentData[2];
                                booking.price = argumentData[4];
                                booking.img = argumentData[8];
                                // print('booking');
                                save(context);
                              },
                            ),
                          ),
                        ),
                      ),
                      addVerticalSpace(20),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

//   //table calendar
//   Widget _tableCalendar() {
//     return TableCalendar(
//       focusedDay: _focusDay,
//       firstDay: DateTime.now(),
//       lastDay: DateTime(2023, 12, 31),
//       calendarFormat: _format,
//       currentDay: _currentDay,
//       rowHeight: 48,
//       calendarStyle: const CalendarStyle(
//         todayDecoration:
//             BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
//       ),
//       availableCalendarFormats: const {
//         CalendarFormat.month: 'Month',
//       },
//       onFormatChanged: (format) {
//         setState(() {
//           _format = format;
//         });
//       },
//       onDaySelected: ((selectedDay, focusedDay) {
//         setState(() {
//           _currentDay = selectedDay;
//           _focusDay = focusedDay;
//           _dateSelected = true;

//           //check if weekend is selected
//           if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
//             _isWeekend = true;
//             _timeSelected = false;
//             _currentIndex = null;
//           } else {
//             _isWeekend = false;
//           }
//         });
//       }),
//     );
//   }
}
