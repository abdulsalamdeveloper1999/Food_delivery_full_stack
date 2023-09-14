import 'package:flutter/material.dart';
import 'package:food_delivery_full_stack_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double? size;
  TextOverflow? overflow;

  BigText({
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 20.0,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size == 0 ? Dimensions.font20 : size,
        color: color,
      ),
    );
  }
}
