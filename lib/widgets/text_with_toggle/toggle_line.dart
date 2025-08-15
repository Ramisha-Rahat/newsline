import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsline/shared/constants/app_colors.dart';
import 'package:newsline/shared/utils/responsive_utils.dart';

class ToggleLine extends StatefulWidget {
  final String label;

  const ToggleLine({super.key, required this.label});

  @override
  _ToggleLineState createState() => _ToggleLineState();
}

class _ToggleLineState extends State<ToggleLine> {
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(widget.label, style: TextStyle(fontSize: Responsive.fontSize(4)),)),
            CupertinoSwitch(
              value: _isSwitchOn,
              onChanged: (bool value) {
                setState(() {
                  _isSwitchOn = value;
                });
              },
              activeColor: AppColors.primary
            ),
          ],
        ),
      ),
    );
  }
}