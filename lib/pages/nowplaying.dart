// import 'package:cafe/pages/nowplayingscreen.dart';
// import 'package:flutter/material.dart';

// class NowPlaying extends StatelessWidget {
//   const NowPlaying({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {  
    
//     return Container(
//       height: 80,
//       width: double.infinity,
//       color: Color.fromARGB(209, 115, 67, 236),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Wrap(
//             crossAxisAlignment: WrapCrossAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(5.0), //or 15.0
//                   child: Container(
//                     decoration: BoxDecoration(),
//                     height: 60.0,
//                     width: 50,
//                     child: Image.asset(
//                       'Assets/10.jpg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 60,
//                 child: Text(
//                   'PETTA',
//                   style: TextStyle(
//                       fontSize: 18, overflow: TextOverflow.ellipsis),
//                 ),
//               )
//             ],
//           ),
//           Wrap(
//             spacing: 15.0,
//             crossAxisAlignment: WrapCrossAlignment.center,
//             children: [
//               Icon(
//                 Icons.skip_previous,
//                 size: 40,
//               ),
//               Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(60),
//                       color: Colors.white),
//                   child: Icon(
//                     Icons.play_arrow,
//                     size: 45,
//                   )),
//               Icon(
//                 Icons.skip_next,
//                 size: 45,
//               ),
//               IconButton(
//                   onPressed: () {
//                     // Navigator.of(context).push(MaterialPageRoute(
//                     //     builder: (ctx1) => NowPlayingScreen(songs: [],)));
//                   },
//                   icon: Icon(
//                     Icons.keyboard_arrow_up_rounded,
//                     size: 40,
//                   ))
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//   // Future<void> showmodalsheet (BuildContext context)async{
//   //   showModalBottomSheet(context: context, builder: (ctx1){
//   //   return  NowPlayingScreen();
//   //   });

//   // }

// }
