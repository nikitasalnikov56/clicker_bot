import 'package:clicker/ui/resources/app_images.dart';
import 'package:flutter/material.dart';

class PositionedMenu extends StatelessWidget {
  const PositionedMenu({
    super.key,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: Image.asset(
        AppImages.gunMenu,
      ),
    );
  }
}

