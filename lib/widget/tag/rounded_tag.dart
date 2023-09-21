import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedTag extends StatelessWidget {
  final Color? fillColor;
  final Color? foregroundColor;
  final bool? filled;
  final bool? withBorder;
  final String text;
  final TextStyle? textStyle;
  final bool? withIcon;
  final IconData? icon;
  final double? radius;
  final Function()? onIconPressed;

  const RoundedTag({
    super.key,
    this.fillColor = Colors.grey,
    this.foregroundColor = Colors.grey,
    this.filled = false,
    required this.text,
    this.textStyle,
    this.withIcon = false,
    this.icon = FontAwesomeIcons.x,
    this.withBorder = false,
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
        border: Border.all(
          color: filled!
              ? Colors.transparent
              : (withBorder! ? fillColor! : Colors.transparent),
          width: 0.5,
        ),
        color: filled! ? fillColor : Colors.white,
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
                    color: filled! ? Colors.white : foregroundColor,
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
                        color: filled! ? Colors.white : foregroundColor,
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
