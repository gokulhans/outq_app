import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outq_new_app/Backend/api/user_api.dart';
import 'package:outq_new_app/screens/user/booking/booking.dart';
import 'package:outq_new_app/screens/user/store/view_store/user_view_single_store.dart';
import 'package:outq_new_app/screens/user/store/view_store/user_view_store.dart';
import 'package:outq_new_app/utils/constants.dart';
import 'package:outq_new_app/utils/sizes.dart';
import 'package:http/http.dart' as http;

class UserSearchServicesPage extends StatelessWidget {
  const UserSearchServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: tDefaultSize),
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: tDefaultSize),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[100],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 14),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: http.get(Uri.parse(
                  '${apidomain}service/getall')),
              builder: (BuildContext context,
                  AsyncSnapshot<http.Response> snapshot) {
                if (snapshot.hasData) {
                  var data = jsonDecode(snapshot.data!.body);
                  // return Expanded(
                  //   child: ListView.builder(
                  //     itemCount: data.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return ListTile(
                  //         title: Text(data[index]['name']),
                  //       );
                  //     },
                  //   ),
                  // );
                  return Expanded(
                    flex: 3,
                    child: ListView.builder(
                      padding:
                          const EdgeInsets.symmetric(horizontal: tDefaultSize),
                      physics: const BouncingScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(data[i]['img']),
                                    width: 60,
                                    height: 50,
                                  ),
                                  // child: const Image(
                                  //     image: AssetImage(
                                  //         'assets/images/userImage.png'))
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[i]['name'],
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      Text(
                                        data[i]['description'],
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                      // Text('\$7',
                                      //     textAlign: TextAlign.left,
                                      //     style: Theme.of(context)
                                      //         .textTheme
                                      //         .headline5),
                                    ]),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 100,
                                  height: 25,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(17.5),
                                      topRight: Radius.circular(17.5),
                                      bottomLeft: Radius.circular(17.5),
                                      bottomRight: Radius.circular(17.5),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment(0.8459399938583374,
                                          0.1310659646987915),
                                      end: Alignment(-0.1310659646987915,
                                          0.11150387674570084),
                                      colors: [
                                        Color.fromRGBO(0, 81, 255, 1),
                                        Color.fromRGBO(0, 132, 255, 1)
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                      child: TextButton(
                                    onPressed: () {
                                      Get.to(() => UserViewSingleStorePage(),
                                          arguments: [
                                            data[i]['storeid'],
                                          ]);
                                    },
                                    child: Text(
                                      "Book",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 10,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w600,
                                        height: 1,
                                      ),
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Container(
                      height: 200,
                      width: 200,
                      child: const Center(child: CircularProgressIndicator()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
