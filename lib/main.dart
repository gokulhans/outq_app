import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outq_new_app/screens/shared/splash/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            headline1: GoogleFonts.poppins(
              color: Colors.black87,
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
            ),
            headline2: GoogleFonts.montserrat(
              color: Colors.black87,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            headline4: GoogleFonts.poppins(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            subtitle2: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: 16,
            ),
          )
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Home",
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const SplashScreen());
            },
            child: const Text("Splash"),
          ),
        ],
      )),
    );
  }
}
