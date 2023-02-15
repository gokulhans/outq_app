import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:outq_new_app/screens/user/booking/success_booked.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_appbar.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_bar_main.dart';
import 'package:outq_new_app/utils/widget_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

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
                    // Text(argumentData[1]),
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
                        print(date.toString());
                      },
                    ),
                    // _tableCalendar(),
                    addVerticalSpace(30),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        'Select Consultation Time',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    addVerticalSpace(0),
                  ],
                ),
              ),
              _isWeekend
                  ? SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30),
                        alignment: Alignment.center,
                        child: const Text(
                          'Weekend is not available, please select another date',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  : SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                _currentIndex = index;
                                _timeSelected = true;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: _currentIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(15),
                                color:
                                    _currentIndex == index ? Colors.blue : null,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _currentIndex == index
                                      ? Colors.white
                                      : null,
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: 8,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, childAspectRatio: 1.5),
                    ),
              SliverToBoxAdapter(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
                  child: Button(
                    width: double.infinity,
                    title: 'Book Appointment',
                    onPressed: () async {
                      Get.to(() => const AppointmentBooked());
                      //convert date/day/time into string first
                      // final getDate = DateConverted.getDate(_currentDay);
                      // final getDay = DateConverted.getDay(_currentDay.weekday);
                      // final getTime = DateConverted.getTime(_currentIndex!);

                      // final booking = await DioProvider().bookAppointment(
                      //     getDate, getDay, getTime, doctor['doctor_id'], token!);

                      //if booking return status code 200, then redirect to success booking page

                      // if (booking == 200) {
                      //   MyApp.navigatorKey.currentState!
                      //       .pushNamed('success_booking');
                      // }
                    },
                    disable: _timeSelected || _dateSelected ? false : true,
                  ),
                ),
              ),
            ],
          ),
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
