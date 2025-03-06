import 'package:flutter/material.dart';


class LoginField extends StatelessWidget {
  const LoginField({super.key, required this.controller, required this.text});
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextFormField(
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15.0), // Adjust curvature here
            ),
            hintText: text,
            hintStyle: const TextStyle(fontWeight: FontWeight.w300)),
        controller: controller,
      ),
    );
  }
}
