import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:outq_new_app/Backend/models/owner_models.dart';
import 'package:outq_new_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future getAllStores() async {
  var response = await http.get(Uri.parse('${apidomain}store/store/get'));
  var jsonData = jsonDecode(response.body);
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

Future getSingleStore(var storeid) async {
  print(storeid);
  var response =
      await http.get(Uri.parse('${apidomain}store/store/get/$storeid'));
  var jsonData = jsonDecode(response.body);
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
