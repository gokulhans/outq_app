import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:outq_new_app/Backend/models/owner_models.dart';
import 'package:outq_new_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future getOwnerStore() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  var ownerid = pref.getString("ownerid");

  var response = await http.get(Uri.parse('${apidomain}store/$ownerid'));
  var jsonData = jsonDecode(response.body);
  pref.setString("storeid", jsonData[0]["type"]);
  print(jsonData);

  List<Store> stores = [];

  for (var u in jsonData) {
    Store store = Store(u["_id"], u["name"], u["location"], u["id"],
        u["description"], u["type"]);
    stores.add(store);
  }
  print(stores);
  return stores;
}

Future getStoreServices() async {
  print('d');
  SharedPreferences pref = await SharedPreferences.getInstance();

  var storeid = pref.getString("storeid");
  var response = await http.get(Uri.parse('${apidomain}service/get/$storeid'));
  var jsonData = jsonDecode(response.body);
  List<GetServiceModel> services = [];

  for (var u in jsonData) {
    GetServiceModel service = GetServiceModel(u["_id"], u["name"],
        u["description"], u["price"], u["storeid"], u["ownerid"], u["id"]);
    services.add(service);
  }
  return services;
}

Future deleteService(var serviceid) async {
  print('jdbfbj');
  var response =
      await http.get(Uri.parse('${apidomain}service/del/$serviceid'));
  return true;
}
