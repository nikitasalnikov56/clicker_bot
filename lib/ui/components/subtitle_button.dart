
import 'package:clicker/ui/style/app_colors.dart';
import 'package:clicker/ui/style/app_style.dart';
import 'package:flutter/material.dart';

class SubTitleButton extends StatelessWidget {
  const SubTitleButton({
    super.key,
    required this.onTap,
    required this.image,
    required this.text,
  });
  final Function() onTap;
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 36,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(image),
            ),
          ),
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: AppStyle.textStyle.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
