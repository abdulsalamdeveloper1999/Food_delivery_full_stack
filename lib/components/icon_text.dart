import 'package:flutter/material.dart';
import 'package:food_delivery_full_stack_app/components/small_text.dart';
import 'package:food_delivery_full_stack_app/utils/dimensions.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final IconData icon;

  final Color iconColor;

  IconAndText({
    required this.text,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: Dimensions.iconSize24,
          color: iconColor,
        ),
        SizedBox(width: 5),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
