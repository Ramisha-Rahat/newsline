import 'package:flutter/material.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void _showSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        color: Colors.white,
        child: Center(
          child: Text(
            'Modal Bottom Sheet',
            style: TextStyle(fontSize: Responsive.fontSize(2)),
          ),
        ),
      ),
    );
  }

  //
  // showDialogConfirmation(){
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text("Title"),
  //         content: Text("This is a dialog."),
  //         actions: [
  //           TextButton(
  //             child: Text("OK"),
  //             onPressed: () {
  //               Navigator.of(context).pop(); // close the dialog
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         ElevatedButton(onPressed: (){

           showDialog(
             context: context,  // context from the build method
             builder: (conte) {
               return AlertDialog(
                 title: Text('Hello'),
                 content: Text('This is a dialog triggered from ElevatedButton', style: TextStyle(
                   fontSize: Responsive.fontSize(5)
                 ),),
                 actions: [
                   TextButton(
                     onPressed: () {
                       Navigator.of(conte).pop(); // closes the dialog
                     },
                     child: Text('Close'),
                   ),
                 ],
               );
             },
           );

         }, child: Text('hh')),

        ],
      ),
      // body: Stack(
      //   children: [
      //     Center(
      //       child: DraggableScrollableSheet(
      //         initialChildSize: 0.2, // initial height fraction (20% of screen)
      //         minChildSize: 0.1, // min height fraction (10%)
      //         maxChildSize: 0.7, // max height fraction (70%)
      //         builder: (context, scrollController) {
      //           return Container(
      //             decoration: BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.vertical(
      //                 top: Radius.circular(20),
      //               ),
      //               boxShadow: [
      //                 BoxShadow(color: Colors.black26, blurRadius: 10),
      //               ],
      //             ),
      //             child: Center(
      //               child: Text(
      //                 'hello',
      //                 style: TextStyle(fontSize: Responsive.fontSize(5)),
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

//       body: Stack(
//         children: [
//           Positioned(
//             bottom: 1,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: 40,
//               color: Colors.grey[300],
//               child: GestureDetector(
//                 onHorizontalDragStart: (details) {
//                   _showSheet();
//                 },
//                 ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
