import 'package:flutter/material.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_appbar.dart';

class OwnerViewServicePage extends StatelessWidget {
  const OwnerViewServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: OwnerAppBarWithBack(
          title: "Owner View Service",
        ),
      ),
      body: Center(
        child: Text("Owner View Service"),
      ),
    );
  }
}