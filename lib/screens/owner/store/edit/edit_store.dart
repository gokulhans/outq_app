import 'package:flutter/material.dart';
import 'package:outq_new_app/screens/owner/components/appbar/owner_appbar.dart';

class EditStorePage extends StatelessWidget {
  const EditStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: OwnerAppBarWithBack(
          title: "Edit Store",
        ),
      ),
      body: Center(
        child: Text("Edit Store"),
      ),
    );
  }
}