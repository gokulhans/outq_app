import 'dart:math';
import 'package:flutter/material.dart';
import 'package:outq_new_app/Backend/models/owner_models.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_appbar.dart';
import 'package:outq_new_app/screens/owner/home/owner_home.dart';
import 'package:outq_new_app/screens/owner/store/Edit/Edit_store.dart';
import 'package:outq_new_app/utils/color_constants.dart';
import 'package:outq_new_app/utils/constants.dart';
import 'package:outq_new_app/utils/sizes.dart';
import 'package:outq_new_app/utils/widget_functions.dart';
import 'package:http/http.dart' as http;

class EditServicePage extends StatefulWidget {
  const EditServicePage({super.key});

  @override
  State<EditServicePage> createState() => _EditServicePageState();
}

class _EditServicePageState extends State<EditServicePage> {
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
            child: Text(
          "Save",
          style: Theme.of(context).textTheme.headline6,
        )),
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
                      'Fill Your Service Details',
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
              const EditServiceForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class EditServiceForm extends StatefulWidget {
  const EditServiceForm({super.key});

  @override
  State<EditServiceForm> createState() => _EditServiceFormState();
}

ServiceModel service = ServiceModel('', '', '', '', '');

class _EditServiceFormState extends State<EditServiceForm> {
  Future save() async {
    http.post(
        Uri.parse(
          "${apidomain}services",
        ),
        headers: <String, String>{
          'Context-Type': 'application/json; charset=UTF-8',
        },
        body: <String, String>{
          'name': service.name,
          'description': service.description,
          'price': service.price,
          'ownerid': service.ownerid,
          'storeid': service.storeid,
        });
    // Get.to(() => {const OwnerHomePage()});
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) => const OwnerHomePage()),
        (Route<dynamic> route) => false);
  }

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
                child: TextField(
                  onChanged: (val) {
                    service.name = val;
                  },
                  decoration: const InputDecoration(
                    labelText: 'service Name',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    // hintText: 'myservice..',
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
                child: TextField(
                  onChanged: (val) {
                    service.description = val;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    // hintText: 'myservice..',
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
                child: TextField(
                  onChanged: (val) {
                    service.price = val;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    // hintText: 'myservice..',
                  ),
                ),
              ),
              addVerticalSpace(100)
            ],
          ),
        ));
  }
}
