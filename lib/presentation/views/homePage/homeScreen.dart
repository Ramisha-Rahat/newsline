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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

    );
  }
}

