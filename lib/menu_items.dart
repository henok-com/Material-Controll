import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;
  final BuildContext ctx;
  const MenuItem({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
    required this.ctx,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          height: 50,
          color: isHovered
              ? Theme.of(context).colorScheme.inversePrimary
              : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Icon(
                  widget.icon,
                  color: const Color(0xFF008E53),
                  size: 30,
                ),
                const SizedBox(
                  width: 2,
                ),
                Container(
                  width: 2,
                  height: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
