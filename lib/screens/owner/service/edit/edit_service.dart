import 'package:flutter/material.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_appbar.dart';

class EditServicePage extends StatelessWidget {
  const EditServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: OwnerAppBarWithBack(
          title: "Edit Service",
        ),
      ),
      body: Center(
        child: Text("Edit Service"),
      ),
    );
  }
}