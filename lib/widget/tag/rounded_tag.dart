import 'package:flutter/material.dart';

class RoundedTag extends StatelessWidget {
  final Color? fillColor;
  final Color? foregroundColor;
  final bool? filled;
  final String text;
  final TextStyle? textStyle;

  const RoundedTag({
    super.key,
    this.fillColor = Colors.grey,
    this.foregroundColor = Colors.grey,
    this.filled = false,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
        border: Border.all(
          color: filled! ? Colors.transparent : fillColor!,
          width: 0.5,
        ),
        color: filled! ? fillColor : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Center(
          child: Text(
            text,
            style: textStyle ??
                TextStyle(
                  color: filled! ? Colors.white : foregroundColor,
                  fontSize: 14,
                ),
          ),
        ),
      ),
    );
  }
}
