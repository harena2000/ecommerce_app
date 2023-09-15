import 'package:flutter/material.dart';

class NavbarIcon extends StatelessWidget {
  final IconData activateIcon;
  final IconData deactivateIcon;
  final Color? activateColor;
  final Color? deactivateColor;
  final bool? isActivate;
  final String text;

  const NavbarIcon({
    super.key,
    required this.activateIcon,
    required this.deactivateIcon,
    this.isActivate = false,
    this.activateColor = Colors.black,
    this.deactivateColor = Colors.grey,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          isActivate! ? activateIcon : deactivateIcon,
          size: 30,
          color: isActivate! ? activateColor : deactivateColor,
        ),
        Visibility(
          visible: !isActivate!,
          child: Text(
            text,
            style:
                TextStyle(color: isActivate! ? activateColor : deactivateColor),
          ),
        ),
      ],
    );
  }
}
