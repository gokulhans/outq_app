import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:outq_new_app/Backend/models/models.dart';

// {"name":"govind","pswd":"1234"}

Future getUsers() async {
  var response = await http
      .get(Uri.parse('https://outq-z6osk.ondigitalocean.app/test/api/reg'));
  var jsonData = jsonDecode(response.body);

  List<Users
  > users = [];

  for (var u in jsonData) {
    Users user = Users(u["name"], u["pswd"]);
    users.add(user);
  }
  print(users);
  return users;
}
