import 'package:ecommerce_app/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SimpleTag extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String text;
  final TextStyle? textStyle;
  final bool? withIcon;
  final IconData? icon;
  final double? radius;
  final void Function()? onIconPressed;

  const SimpleTag({
    super.key,
    this.backgroundColor = Colors.grey,
    this.foregroundColor = Colors.black,
    required this.text,
    this.textStyle,
    this.withIcon = false,
    this.icon = FontAwesomeIcons.x,
    this.radius = 100,
    this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius!),
        ),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: withIcon!
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle ??
                  TextStyle(
                    color: foregroundColor,
                    fontSize: 16,
                  ),
            ),
            Visibility(
              visible: withIcon!,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 20,
                    child: IconButton(
                      onPressed: () => onIconPressed!(),
                      icon: Icon(
                        icon!,
                        color: foregroundColor,
                        size: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
