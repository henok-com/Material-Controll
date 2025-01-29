import 'package:flutter/material.dart';
import 'package:matrial_controll/colors.dart';

class PrimaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onClick;
  const PrimaryButton({super.key, required this.text, required this.onClick});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              overlayColor: Colors.white,
            ),
            onPressed: widget.onClick,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 0,
              ),
              child: Text(
                widget.text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondaryButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool pressed;
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.pressed = false,
  });

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: TextButton(
        onPressed: widget.onPressed,
        onHover: (value) {
          setState(() {
            if (!widget.pressed) {
              active = !active;
            }
          });
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          backgroundColor: active || widget.pressed
              ? const Color(0xFFA4DA65)
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          overlayColor: Colors.transparent,
          side: const BorderSide(
            color: Color(0xFFA4DA65),
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: active || widget.pressed
                ? const Color(0xFF008E53)
                : const Color(0xFFA4DA65),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
