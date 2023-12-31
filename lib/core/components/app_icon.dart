import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;

  final double size;
  final double iconSize;

  const AppIcon({
    super.key,
    required this.icon,
    this.iconSize = 16,
    this.iconColor = const Color(0xff756d54),
    this.backgroundColor = const Color(0xfffcf4e4),
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
