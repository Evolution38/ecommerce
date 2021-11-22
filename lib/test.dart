// ----------------------------------------------------Internet Connectivity-----------------------------------------------

// import 'package:ecommerce/src/Widgets/my_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_offline/flutter_offline.dart';

// class Connectivity extends StatelessWidget {
//   const Connectivity({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(),
//       body: OfflineBuilder(
//         connectivityBuilder: (context, connectivity, child) {
//           final bool connected = connectivity != ConnectivityResult.none;
//           return Stack(
//             fit: StackFit.expand,
//             children: [
//               Positioned(
//                 height: 24,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   color: connected ? const Color(0xFF00EE44) : const Color(0xFFEE4400),
//                   child: Center(
//                     child: Text(connected ? 'ONLINE' : 'OFFLINE'),
//                   ),
//                 ),
//               ),
//               const Center(
//                 child: Text(
//                   'Hello!'
//                 ),
//               ),
//             ],
//           );
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const[
//             Text('Just turn off your internet')
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors_in_immutables, prefer_final_fields

