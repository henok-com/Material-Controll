import 'package:flutter/material.dart';

class PrimaryTextField extends StatefulWidget {
  final String hintText;
  final Widget? prefixIcon;
  const PrimaryTextField({super.key, required this.hintText, this.prefixIcon});

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Color(0xFF006C00),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Color(0xFF006C00),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(161, 0, 108, 0),
        ),
        prefixIcon: widget.prefixIcon,
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
