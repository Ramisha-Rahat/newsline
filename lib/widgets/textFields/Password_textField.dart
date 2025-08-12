import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final Color? cursorColor;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;

  const PasswordTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.cursorColor,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.textInputAction,
    this.backgroundColor, // NEW
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscure = true;

  void _toggleVisibility() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.backgroundColor != null
          ? BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      )
          : null, // No background if not specified
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        cursorColor: widget.cursorColor ?? Theme.of(context).primaryColor,
        obscureText: _obscure,
        textInputAction: widget.textInputAction,
        keyboardType: TextInputType.visiblePassword,
        validator: widget.validator,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: Colors.grey)
              : null,
          suffixIcon: IconButton(
            icon: Icon(
              _obscure ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: _toggleVisibility,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
