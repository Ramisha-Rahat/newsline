import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsline/shared/constants/app_colors.dart';

class ToggleLine extends StatefulWidget {
  final String label;

  const ToggleLine({super.key, required this.label});

  @override
  _ToggleLineState createState() => _ToggleLineState();
}

class _ToggleLineState extends State<ToggleLine> {
  bool _isSwitchOn = false; // Initial state of the switch

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.label),
          //SizedBox(width: 70,),
          CupertinoSwitch(
            value: _isSwitchOn,
            onChanged: (bool value) {
              setState(() {
                _isSwitchOn = value;
              });
            },
            activeColor: AppColors.primary, // Set the switch color when active
          ),
        ],
      ),
    );
  }
}