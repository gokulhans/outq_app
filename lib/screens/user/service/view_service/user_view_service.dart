import 'package:flutter/material.dart';
import 'package:outq_new_app/screens/user/components/appbar/user_appbar.dart';

class UserSingleServicePage extends StatelessWidget {
  const UserSingleServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(children: <Widget>[
            const Image(
              image: AssetImage("assets/images/userImage.png"),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            ClipRRect(
              borderRadius: new BorderRadius.circular(80.0),
              child: Container(
                margin: EdgeInsets.only(top: 300.0),
                color: Colors.white,
                height: double.infinity,
                child: Text("nd"),
              ),
            ),
          ]),
        ],
      ),
    ));
  }
}
