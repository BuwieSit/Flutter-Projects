import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,

          decoration: InputDecoration(
            labelText: label,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                width: 1.5,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorLight,
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}