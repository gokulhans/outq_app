import 'package:flutter/material.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_appbar.dart';

class OwnerViewStorePage extends StatelessWidget {
  const OwnerViewStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: OwnerAppBarWithBack(
          title: "Owner View Store",
        ),
      ),
      body: Column(
        children: [
          Text("name"),
          Text("location"),
          Text("description"),
          Text("type"),
          Text("ownerid"),
        ],
      ),
    );
  }
}
