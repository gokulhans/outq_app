import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outq_new_app/Backend/models/owner_models.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_appbar.dart';
import 'package:outq_new_app/screens/owner/home/owner_home.dart';
import 'package:outq_new_app/screens/owner/store/view/owner_view_store.dart';
import 'package:outq_new_app/screens/shared/welcome_screen/welcome_screen.dart';
import 'package:outq_new_app/utils/color_constants.dart';
import 'package:outq_new_app/utils/constants.dart';
import 'package:outq_new_app/utils/sizes.dart';
import 'package:outq_new_app/utils/widget_functions.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future save(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String ownerid = prefs.getString("ownerid") ?? "null";

  if (ownerid == "null") {
    Get.to(() => const WelcomeScreen());
  }

  print({shop.name, shop.type, shop.description, shop.location});
  http.post(
      Uri.parse(
        "${apidomain}store/edit/${shop.type}",
      ),
      headers: <String, String>{
        'Context-Type': 'application/json; charset=UTF-8',
      },
      body: <String, String>{
        'name': shop.name,
        'location': shop.location,
        'id': ownerid,
        'description': shop.description,
        'type': shop.type,
      });

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (BuildContext context) => OwnerHomePage(currentIndex: 1)),
      (Route<dynamic> route) => false);
}

class EditStorePage extends StatefulWidget {
  final ownerid;
  dynamic argumentData = Get.arguments;
  EditStorePage({super.key, required this.ownerid});

  @override
  State<EditStorePage> createState() => _EditStorePageState();
}

class _EditStorePageState extends State<EditStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: OwnerAppBarWithBack(
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
              shop.type = widget.argumentData.type;
              shop.id = widget.argumentData.id;
              save(context);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 150,
                padding: const EdgeInsets.only(right: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fill Your Shop Details',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      'This data will be displayed in your account profile.',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
              EditStoreForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class EditStoreForm extends StatefulWidget {
  dynamic argumentData = Get.arguments;
  EditStoreForm({super.key});

  @override
  State<EditStoreForm> createState() => _EditStoreFormState();
}

Store shop = Store('', '', '', '', '', '');

class _EditStoreFormState extends State<EditStoreForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextFormField(
                  initialValue: widget.argumentData.name,
                  onChanged: (val) {
                    shop.name = val;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Shop Name',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    // hintText: widget.argumentData.id,
                  ),
                ),
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextFormField(
                  initialValue: widget.argumentData.location,
                  onChanged: (val) {
                    shop.location = val;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    // hintText: 'myshop..',
                  ),
                ),
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: TextFormField(
                  initialValue: widget.argumentData.description,
                  onChanged: (val) {
                    shop.description = val;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    // hintText: 'myshop..',
                  ),
                ),
              ),
              // Container(
              //   height: 80,
              //   padding: const EdgeInsets.symmetric(vertical: 12.0),
              //   clipBehavior: Clip.antiAlias,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(22),
              //   ),
              //   child: TextField(
              //     onChanged: (val) {
              //       shop.type = val;
              //     },
              //     decoration: const InputDecoration(
              //       labelText: 'Type',
              //       labelStyle: TextStyle(
              //         fontFamily: 'Montserrat',
              //         fontWeight: FontWeight.bold,
              //         color: Colors.grey,
              //       ),
              //       // hintText: 'myshop..',
              //     ),
              //   ),
              // ),
              addVerticalSpace(100)
            ],
          ),
        ));
  }
}
