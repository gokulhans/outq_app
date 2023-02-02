import 'package:flutter/material.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_appbar.dart';

class CreateServicePage extends StatelessWidget {
  const CreateServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: OwnerAppBarWithBack(
          title: "Create Service",
        ),
      ),
      body: Center(
        child: Text("Create Service"),
      ),
    );
  }
}