import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:outq_new_app/Backend/models/owner_models.dart';
import 'package:outq_new_app/utils/constants.dart';

Future getOwnerStore() async {
  var response = await http.get(Uri.parse('${apidomain}store/store'));
  var jsonData = jsonDecode(response.body);
  print(jsonData);
  var str = jsonData[0]["storeName"];
  // List<Store> stores = [];

  // for (var u in jsonData) {
  //   Store store = Store(u["_id"], u["name"], u["location"], u["id"],
  //       u["description"], u["type"]);
  //   stores.add(store);
  // }
  print(str);
  // print("object");
  return str;
}
