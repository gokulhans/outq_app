// import 'package:flutter/material.dart';
// import 'package:outq_new_app/screens/user/booking/booking.dart';
// import 'package:outq_new_app/utils/config.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DoctorDetails extends StatefulWidget {
//   const DoctorDetails({Key? key, 
//   // this.doctor,
//    required this.isFav})
//       : super(key: key);
//   // final Map<String, dynamic> doctor;
//   final bool isFav;

//   @override
//   State<DoctorDetails> createState() => _DoctorDetailsState();
// }

// class _DoctorDetailsState extends State<DoctorDetails> {
//   Map<String, dynamic> doctor = {};
//   bool isFav = false;

//   // @override
//   // void initState() {
//   //   // doctor = widget.doctor;
//   //   isFav = widget.isFav;
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         AboutDoctor(
//           doctor: doctor,
//         ),
//         DetailBody(
//           doctor: doctor,
//         ),
//         const Spacer(),
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Button(
//             width: double.infinity,
//             title: 'Book Appointment',
//             onPressed: () {
//               Navigator.of(context).pushNamed('booking_page',
//                   arguments: {"doctor_id": doctor['doc_id']});
//             },
//             disable: false,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class AboutDoctor extends StatelessWidget {
//   const AboutDoctor({Key? key, required this.doctor}) : super(key: key);

//   final Map<dynamic, dynamic> doctor;

//   @override
//   Widget build(BuildContext context) {
//     // Config().init(context);
//     return Container(
//       width: double.infinity,
//       child: Column(
//         children: <Widget>[
//           CircleAvatar(
//             radius: 65.0,
//             backgroundImage: NetworkImage(
//               "http://127.0.0.1:8000${doctor['doctor_profile']}",
//             ),
//             backgroundColor: Colors.white,
//           ),
//           Config.spaceMedium,
//           Text(
//             "Dr ${doctor['doctor_name']}",
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 24.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Config.spaceSmall,
//           SizedBox(
//             width: Config.widthSize * 0.75,
//             child: const Text(
//               'MBBS (International Medical University, Malaysia), MRCP (Royal College of Physicians, United Kingdom)',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 15,
//               ),
//               softWrap: true,
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Config.spaceSmall,
//           SizedBox(
//             width: Config.widthSize * 0.75,
//             child: const Text(
//               'Sarawak General Hospital',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15,
//               ),
//               softWrap: true,
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DetailBody extends StatelessWidget {
//   const DetailBody({Key? key, required this.doctor}) : super(key: key);
//   final Map<dynamic, dynamic> doctor;

//   @override
//   Widget build(BuildContext context) {
//     Config().init(context);
//     return Container(
//       padding: const EdgeInsets.all(10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Config.spaceSmall,
//           DoctorInfo(
//             patients: doctor['patients'],
//             exp: doctor['experience'],
//           ),
//           Config.spaceMedium,
//           const Text(
//             'About Doctor',
//             style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//           ),
//           Config.spaceSmall,
//           Text(
//             'Dr. ${doctor['doctor_name']} is an experience ${doctor['category']} Specialist at Sarawak, graduated since 2008, and completed his/her training at Sungai Buloh General Hospital.',
//             style: const TextStyle(
//               fontWeight: FontWeight.w500,
//               height: 1.5,
//             ),
//             softWrap: true,
//             textAlign: TextAlign.justify,
//           )
//         ],
//       ),
//     );
//   }
// }

// class DoctorInfo extends StatelessWidget {
//   const DoctorInfo({Key? key, required this.patients, required this.exp})
//       : super(key: key);

//   final int patients;
//   final int exp;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         InfoCard(
//           label: 'Patients',
//           value: '$patients',
//         ),
//         const SizedBox(
//           width: 15,
//         ),
//         InfoCard(
//           label: 'Experiences',
//           value: '$exp years',
//         ),
//         const SizedBox(
//           width: 15,
//         ),
//         const InfoCard(
//           label: 'Rating',
//           value: '4.6',
//         ),
//       ],
//     );
//   }
// }

// class InfoCard extends StatelessWidget {
//   const InfoCard({Key? key, required this.label, required this.value})
//       : super(key: key);

//   final String label;
//   final String value;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Config.primaryColor,
//         ),
//         padding: const EdgeInsets.symmetric(
//           vertical: 15,
//           horizontal: 15,
//         ),
//         child: Column(
//           children: <Widget>[
//             Text(
//               label,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               value,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 15,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
