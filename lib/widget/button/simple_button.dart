import 'package:ecommerce_app/constant/app_colors.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final ButtonStyle? style;
  final void Function()? onPressed;

  const SimpleButton({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.darkGrey,
    this.foregroundColor = Colors.white,
    this.style,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed!(),
      style: style ??
          TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Add to Cart",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
              color: foregroundColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
