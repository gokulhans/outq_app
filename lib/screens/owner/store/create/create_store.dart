import 'dart:math';

import 'package:flutter/material.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_appbar.dart';
import 'package:outq_new_app/utils/color_constants.dart';
import 'package:outq_new_app/utils/sizes.dart';

class CreateStorePage extends StatefulWidget {
  const CreateStorePage({super.key});

  @override
  State<CreateStorePage> createState() => _CreateStorePageState();
}

class _CreateStorePageState extends State<CreateStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: OwnerAppBarWithBack(
          title: "",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.only(right: 60),
                child: Column(
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
                    Column(children: <Widget>[
                      Container(
                          width: 347,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                              bottomLeft: Radius.circular(22),
                              bottomRight: Radius.circular(22),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(
                                      90, 108, 234, 0.07000000029802322),
                                  offset: Offset(0, 0),
                                  blurRadius: 50)
                            ],
                            color: Color.fromRGBO(255, 255, 255, 1),
                          )),
                      Text('First Name',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.subtitle2),
                    ])
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  width: 150,
                  height: 60,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [ColorConstants.bluegradient1, ColorConstants.bluegradient2],
                      transform: const GradientRotation(9 * pi / 180),
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "Save",
                    style: Theme.of(context).textTheme.headline6,
                  )),
                ),
              ),
            ),
            // const CreateStoreForm(),
          ],
        ),
      ),
    );
  }
}

class CreateStoreForm extends StatefulWidget {
  const CreateStoreForm({super.key});

  @override
  State<CreateStoreForm> createState() => _CreateStoreFormState();
}

class _CreateStoreFormState extends State<CreateStoreForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(tDefaultSize),
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: 'Enter a phone number',
                    labelText: 'Phone',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    hintText: 'Enter your date of birth',
                    labelText: 'Dob',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
