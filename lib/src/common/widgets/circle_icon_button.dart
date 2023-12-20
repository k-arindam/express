import 'package:express/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;

  final Color? backgroundColor;
  final Color? iconColor;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  const CircleIconButton({
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.margin,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.0,
        width: 48.0,
        margin: margin ?? const EdgeInsets.only(right: 5.0),
        padding: const EdgeInsets.all(5.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? Constants.kBlack,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor ?? Constants.kWhiteGreen,
        ),
      ),
    );
  }
}
