import 'package:flutter/material.dart';
import 'package:project_demo/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextOverflow overflow;

  const BigText({
    Key? key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0? Dimensions.font20:size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}