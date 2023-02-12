import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outq_new_app/screens/owner/service/create/create_service.dart';
import 'package:outq_new_app/utils/sizes.dart';

class OwnerViewServicePage extends StatelessWidget {
  const OwnerViewServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: tDefaultSize),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Services',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF09041B),
                    fontSize: 18,
                    // height: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => const CreateServicePage());
                    },
                    child: Text(
                      'New +',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFFFF7B32),
                        fontSize: 12,
                        // height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ))
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                // color: Colors.grey[200],
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: const Image(
                                image:
                                    AssetImage('assets/images/userImage.png'))),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Herbal Pancake',
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text(
                                'Herbal Pancake',
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text('\$7',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.headline5),
                            ]),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                              begin: Alignment(
                                  0.8459399938583374, 0.1310659646987915),
                              end: Alignment(
                                  -0.1310659646987915, 0.11150387674570084),
                              colors: [
                                Color.fromRGBO(83, 130, 231, 1),
                                Color.fromRGBO(20, 130, 231, 1)
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Edit',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
