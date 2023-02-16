import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:outq_new_app/Backend/models/user_models.dart';
import 'package:outq_new_app/screens/owner/home/owner_home.dart';
import 'package:outq_new_app/screens/shared/welcome_screen/welcome_screen.dart';
import 'package:outq_new_app/screens/user/booking/success_booked.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_appbar.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_bar_main.dart';
import 'package:outq_new_app/screens/user/home/user_home.dart';
import 'package:outq_new_app/utils/color_constants.dart';
import 'package:outq_new_app/utils/constants.dart';
import 'package:outq_new_app/utils/widget_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

Future save(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String ownerid = prefs.getString("ownerid") ?? "null";
  if (ownerid == "null") {
    Get.to(() => const WelcomeScreen());
  }

  SharedPreferences pref = await SharedPreferences.getInstance();
  String userid = pref.getString("userid") ?? "null";
  if (userid == "null") {
    Get.to(() => const WelcomeScreen());
  }

  // print({shop.name, shop.type, shop.description, shop.location});
  http.post(
      Uri.parse(
        apidomain + "booking/",
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
      });

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => UserHomePage()),
      (Route<dynamic> route) => false);
}

BookingModel booking = BookingModel('', '', '', '', '', '', '');

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
            backgroundColor: Colors.blue,
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
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  String? token; //get token for insert booking date and time into database

  // Time
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
        final localizations = MaterialLocalizations.of(context);
        final formattedTimeOfDay = localizations.formatTimeOfDay(selectedTime);
        booking.start = formattedTimeOfDay;
        booking.end = formattedTimeOfDay;
        // print(booking.date);
      });
  }
  // Future<void> getToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   token = prefs.getString('token') ?? '';
  // }

  // @override
  // void initState() {
  //   getToken();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // Config().init(context);
    // final doctor = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: UserAppBarWithBack(
          title: "",
        ),
      ),
      floatingActionButton: Container(
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
            child: Text(
              "Save",
              style: Theme.of(context).textTheme.headline6,
            ),
            onPressed: () {
              booking.serviceid = argumentData[0];
              booking.storeid = argumentData[2];
              booking.price = "50";
              // booking.price = argumentData[2];
              save(context);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(argumentData[2]),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'Select Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      HorizontalCalendar(
                        date: DateTime.now(),
                        textColor: Colors.black45,
                        backgroundColor: Colors.white,
                        selectedColor: Colors.blue,
                        showMonth: true,
                        onDateSelected: (date) {
                          // print(argumentData);
                          booking.date = date.toString();
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _selectTime(context);
                        },
                        child: const Text('SELECT TIME'),
                      ),
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
