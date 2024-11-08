import 'package:clicker/ui/resources/app_images.dart';
import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.gunBg,
          width: 100,
          height: 100,
          // fit: BoxFit.contain,
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          right: 0,
          child: Image.asset(AppImages.gunBorder),
        ),
        Positioned(
            top: 5,
            left: 0,
            right: 5,
            bottom: 0,
            child: Image.asset(AppImages.gun)),
      ],
    );
  }
}
