import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outq_new_app/screens/owner/auth/signup/signup.dart';
import 'package:outq_new_app/screens/owner/home/owner_home.dart';
import 'package:outq_new_app/utils/color_constants.dart';
import 'package:outq_new_app/utils/sizes.dart';
import 'package:outq_new_app/utils/text_strings.dart';
import 'package:outq_new_app/utils/widget_functions.dart';

class OwnerLoginPage extends StatelessWidget {
  const OwnerLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Center(
                      child: Text(
                        tOwnerLogin,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  padding:
                      const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      const TextField(
                        decoration: InputDecoration(
                            labelText: 'NAME ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      const SizedBox(height: 10.0),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      const SizedBox(height: 10.0),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                      ),

                      const SizedBox(height: 50.0),
                      // ignore: sized_box_for_whitespace
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.blueAccent,
                            color: ColorConstants.blue,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Center(
                                child: TextButton(
                                  child: const Text(
                                    tLogin,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Get.to(() => const OwnerHomePage());
                                  },
                                ),
                              ),
                            ),
                          )),
                      addVerticalSpace(20),
                    ],
                  )),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    tOwnerSignUpQuestion,
                  ),
                  TextButton(
                    child: Text(tOwnerSignUp,
                        style: TextStyle(
                          color: ColorConstants.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        )),
                    onPressed: () => Get.to(() => const OwnerSignUpPage()),
                  )
                ],
              )
            ]),
      ),
    ));
  }
}
