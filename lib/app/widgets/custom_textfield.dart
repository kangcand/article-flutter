import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.title,
    this.function,
    required this.readOnly,
    this.keyType,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final bool readOnly;
  final VoidCallback? function;
  final TextInputType? keyType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyType,
      readOnly: readOnly,
      onTap: function,
      decoration: InputDecoration(
        label: Text(
          title,
          style: const TextStyle(color: Colors.teal),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      controller: controller,
    );
  }
}
