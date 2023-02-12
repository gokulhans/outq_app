import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:outq_new_app/Backend/models/owner_models.dart';
import 'package:outq_new_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future getOwnerStore() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  
  var ownerid = pref.getString("ownerid");

  var response = await http.get(Uri.parse('${apidomain}store/${ownerid}'));
  var jsonData = jsonDecode(response.body);
  print(jsonData[0]);
  var str = jsonData[0]["storeName"];
  pref.setString("storeid", jsonData[0]["type"]);
  List<Store> stores = [];

  for (var u in jsonData) {
    Store store = Store(u["_id"], u["name"], u["location"], u["id"],
        u["description"], u["type"]);
    stores.add(store);
  }
  print(stores);
  // print("object");
  return stores;
}
