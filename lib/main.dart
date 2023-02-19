import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:outq_new_app/Backend/api/api.dart';
import 'package:outq_new_app/screens/shared/exit_pop/exit_pop_up.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:outq_new_app/screens/shared/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white, // navigation bar color
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light),
  );
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // String? ownerid = prefs.getString("ownerid");
  // String? userid = prefs.getString("userid");
  // print(ownerid);
  GeolocatorAndroid.registerWith();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
            headline3: GoogleFonts.poppins(
              color: Colors.black87,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
            headline4: GoogleFonts.poppins(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            headline5: GoogleFonts.poppins(
              color: Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            headline6: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            subtitle1: GoogleFonts.poppins(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            subtitle2: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: 12,
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Users'),
        elevation: 0.0,
        backgroundColor: Colors.indigo[700],
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: getUsers(),
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
                    'No Content is available right now.',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ));
                } else {
                  return Container(
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return Container(
                              child: Text(
                                snapshot.data[i].name,
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            );
                          }));
                }
              }
            },
          ),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const PreferredSize(
//         preferredSize: Size.fromHeight(55),
//         child: OwnerAppBarWithBack(
//           title: "Notifications",
//         ),
//       ),
//       body: SafeArea(
//         child: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "Home",
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Get.to(() => const SplashScreen());
//               },
//               child: const Text("Splash"),
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }
