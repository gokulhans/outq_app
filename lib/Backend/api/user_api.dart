import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:outq_new_app/Backend/models/owner_models.dart';
import 'package:outq_new_app/Backend/models/user_models.dart';
import 'package:outq_new_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future getAllStores() async {
  var response = await http.get(Uri.parse('${apidomain}store/store/get'));
  var jsonData = jsonDecode(response.body);
  print(jsonData);
  List<Store> stores = [];
  for (var u in jsonData) {
    Store store = Store(u["_id"], u["name"], u["location"], u["id"],
        u["description"], u["type"], u["img"]);
    stores.add(store);
  }
  print(stores);
  return stores;
}

Future getSingleStore(var storeid) async {
  print(storeid);
  var response =
      await http.get(Uri.parse('${apidomain}store/store/get/$storeid'));
  var jsonData = jsonDecode(response.body);
  print(jsonData);
  List<Store> stores = [];
  for (var u in jsonData) {
    Store store = Store(u["_id"], u["name"], u["location"], u["id"],
        u["description"], u["type"], u["img"]);
    stores.add(store);
  }
  print(stores);
  return stores;
}

Future getUserBookings() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  var userid = pref.getString("userid");

  var response =
      await http.get(Uri.parse('${apidomain}booking/viewall/$userid'));
  var jsonData = jsonDecode(response.body);
  print(jsonData);

  List<GetBookingModel> bookings = [];
  for (var u in jsonData) {
    GetBookingModel booking = GetBookingModel(
      u["_id"],
      u["start"],
      u["end"],
      u["storeid"],
      u["serviceid"],
      u["userid"],
      u["bookingid"],
      u["price"],
      u["date"],
    );

    bookings.add(booking);
  }
  print(bookings);
  return bookings;
}

Future getTimeSlots(var serviceid) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  var userid = pref.getString("userid");

  var response =
      await http.get(Uri.parse('${apidomain}booking/timeslots/$serviceid'));
  var jsonData = jsonDecode(response.body);
  print(jsonData);

  // List<GetBookingModel> bookings = [];
  // for (var u in jsonData) {
  //   GetBookingModel booking = GetBookingModel(
  //     u["_id"],
  //     u["start"],
  //     u["end"],
  //     u["storeid"],
  //     u["serviceid"],
  //     u["userid"],
  //     u["bookingid"],
  //     u["price"],
  //     u["date"],
  //   );

  //   bookings.add(booking);
  // }
  // print(bookings);
  // return bookings;
}
