import 'package:flutter/material.dart';

class MenuLIne extends StatelessWidget {
  const MenuLIne({
    super.key,
    required this.angle,
    this.bottom,
    this.top,
    this.left,
    this.right,
  });

  final double angle;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Transform.rotate(
        angle: angle,
        child: ColoredBox(
          color: Colors.white.withOpacity(0.2),
          child: const SizedBox(
            width: 73.54,
            height: 2,
          ),
        ),
      ),
    );
  }
}




