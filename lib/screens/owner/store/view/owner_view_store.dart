import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outq_new_app/Backend/api/owner_api.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_appbar.dart';
import 'package:outq_new_app/screens/owner/store/edit/edit_store.dart';
import 'package:outq_new_app/utils/sizes.dart';
import 'package:outq_new_app/utils/widget_functions.dart';

class OwnerViewStorePage extends StatelessWidget {
  const OwnerViewStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: getOwnerStore(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: Placeholder(
                      color: Colors.green,
                    ),
                  );
                } else {
                  if (snapshot.data.length == 0) {
                    return const Center(
                        child: Text(
                      'No Content is available right now.\nWe will Update it with in august 31.',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ));
                  } else {
                    return Expanded(
                        flex: 2,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addVerticalSpace(10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'My Shop Details',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF09041B),
                                          fontSize: 18,
                                          // height: 1.5,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Get.to(() => EditStorePage(
                                                ownerid:
                                                    snapshot.data[i].type),arguments: snapshot.data[i]);
                                          },
                                          child: Text(
                                            'Edit',
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFFFF7B32),
                                              fontSize: 12,
                                              // height: 1.5,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ))
                                    ],
                                  ),
                                  addVerticalSpace(20),
                                  Text(
                                    'Name',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      // height: 1.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  addVerticalSpace(10),
                                  Text(
                                    snapshot.data[i].name,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  addVerticalSpace(20),
                                  Text(
                                    'Image',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF09041B),
                                      fontSize: 15,
                                      // height: 1.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  addVerticalSpace(20),
                                  const Center(
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 200,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        child: Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://images.unsplash.com/photo-1562322140-8baeececf3df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  addVerticalSpace(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Description',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF09041B),
                                          fontSize: 15,
                                          // height: 1.5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      // TextButton(
                                      //     onPressed: () {},
                                      //     child: Text(
                                      //       'Edit',
                                      //       style: GoogleFonts.poppins(
                                      //         color: const Color(0xFFFF7B32),
                                      //         fontSize: 12,
                                      //         // height: 1.5,
                                      //         fontWeight: FontWeight.w500,
                                      //       ),
                                      //     ))
                                    ],
                                  ),
                                  addVerticalSpace(10),
                                  Text(
                                    snapshot.data[i].description,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                  ),
                                  addVerticalSpace(20),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Services',
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF09041B),
                                              fontSize: 15,
                                              // height: 1.5,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          // TextButton(
                                          //   onPressed: () {},
                                          //   child: Text(
                                          //     'Edit',
                                          //     style: GoogleFonts.poppins(
                                          //       color: const Color(0xFFFF7B32),
                                          //       fontSize: 12,
                                          //       // height: 1.5,
                                          //       fontWeight: FontWeight.w500,
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      addVerticalSpace(10),
                                      const ServiceListTile(
                                        name: "Hair Cutting",
                                        price: "10\$",
                                      ),
                                      const ServiceListTile(
                                        name: "Hair Cutting",
                                        price: "10\$",
                                      ),
                                      const ServiceListTile(
                                        name: "Hair Cutting",
                                        price: "10\$",
                                      ),
                                      const ServiceListTile(
                                        name: "Hair Cutting",
                                        price: "10\$",
                                      ),
                                      const ServiceListTile(
                                        name: "Hair Cutting",
                                        price: "10\$",
                                      ),
                                      const ServiceListTile(
                                        name: "Hair Cutting",
                                        price: "10\$",
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }));
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceListTile extends StatelessWidget {
  final name, price;
  const ServiceListTile({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Hair Cutting',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            addHorizontalSpace(20),
            Text(
              '10\$',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        // TextButton(
        //   onPressed: () {},
        //   child: Text(
        //     'Edit',
        //     style: GoogleFonts.poppins(
        //       color: const Color(0xFFFF7B32),
        //       fontSize: 12,
        //       // height: 1.5,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
