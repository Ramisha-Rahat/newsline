import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderRadius;

  const CustomTextButton({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.foregroundColor,
    required this.backgroundColor,
    this.borderColor,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(foregroundColor),
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return foregroundColor.withOpacity(0.1);
          }
          return null;
        }),
        shape: WidgetStateProperty.all(
          borderColor != null
              ? StadiumBorder(side: BorderSide(color: borderColor!))
              : const StadiumBorder(),
        ),
      ),
      child: child,
    );
  }
}