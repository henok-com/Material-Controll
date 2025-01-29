import 'package:flutter/material.dart';

class PrimaryText extends StatefulWidget {
  final double font_size;
  final String text;
  final bool otherColor;
  const PrimaryText(this.text,
      {super.key, required this.font_size, this.otherColor = false});

  @override
  State<PrimaryText> createState() => _PrimaryTextState();
}

class _PrimaryTextState extends State<PrimaryText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: widget.font_size,
        color: widget.otherColor == false
            ? const Color(0xFF008E53)
            : const Color(0xFF006C00),
        fontFamily: "tesfa",
      ),
    );
  }
}

class SecondaryText extends StatefulWidget {
  final double font_size;
  final String text;
  const SecondaryText(this.text, {super.key, required this.font_size});

  @override
  State<SecondaryText> createState() => _SecondaryTextState();
}

class _SecondaryTextState extends State<SecondaryText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: widget.font_size,
        color: const Color(0xFF008E53),
      ),
    );
  }
}

class DashboardTitle extends StatefulWidget {
  final double font_size;
  final String text;
  const DashboardTitle(this.text, {super.key, required this.font_size});

  @override
  State<DashboardTitle> createState() => _DashboardTitleState();
}

class _DashboardTitleState extends State<DashboardTitle> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, 0),
      children: [
        Container(
          width: double.infinity,
          height: 5,
          color: const Color(0xFFA4DA65),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          color: const Color(0xFF008E53),
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: widget.font_size,
              fontFamily: 'tesfa',
            ),
          ),
        ),
      ],
    );
  }
}
