import 'package:clicker/ui/components/custom_widget.dart';
import 'package:clicker/ui/resources/app_images.dart';
import 'package:clicker/ui/style/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 68,
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              decoration: BoxDecoration(
                color: AppColors.black,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.yellow,
                ),
              ),
              child: Image.asset(AppImages.avatar),
            ),
          ),
          Container(
            width: 245,
            height: 95,
            margin: const EdgeInsets.only(top: 15),
            child: const CustomWidget(),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 150);
}