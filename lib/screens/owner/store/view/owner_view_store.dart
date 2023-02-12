import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_appbar.dart';
import 'package:outq_new_app/utils/sizes.dart';
import 'package:outq_new_app/utils/widget_functions.dart';

class OwnerViewStorePage extends StatelessWidget {
  const OwnerViewStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: tDefaultSize),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shop Image',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF09041B),
                    fontSize: 15,
                    // height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                    onPressed: () {},
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
            const Center(
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                TextButton(
                    onPressed: () {},
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
            addVerticalSpace(10),
            Text(
              "Hair Stylists having fun Kulor Salon is the best place for hair styling, located at 22 East Center Street in Logan, Utah",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            addVerticalSpace(20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Edit',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFFF7B32),
                          fontSize: 12,
                          // height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const ServiceListTile(name: "Hair Cutting",price: "10\$",),
                const ServiceListTile(name: "Hair Cutting",price: "10\$",),
                const ServiceListTile(name: "Hair Cutting",price: "10\$",),
                const ServiceListTile(name: "Hair Cutting",price: "10\$",),
              ],
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
        TextButton(
          onPressed: () {},
          child: Text(
            'Edit',
            style: GoogleFonts.poppins(
              color: const Color(0xFFFF7B32),
              fontSize: 12,
              // height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
