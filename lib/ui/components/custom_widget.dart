import 'package:clicker/ui/resources/app_images.dart';
import 'package:clicker/ui/style/app_colors.dart';
import 'package:clicker/ui/style/app_style.dart';
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int level = 28;

    return Stack(
      children: [
        Image.asset(
          AppImages.panel1,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          right: 1.5,
          child: Image.asset(AppImages.panel2),
        ),
        Positioned(
          left: 56,
          top: 7,
          child: Image.asset(
            AppImages.panel4,
          ),
        ),
        Positioned(
          right: 0,
          top: 1.7,
          child: Image.asset(AppImages.panel3),
        ),
        Positioned(
          right: 9,
          top: 41.5,
          child: Image.asset(AppImages.panel5),
        ),
        Positioned(
          right: 90,
          top: 76,
          child: Image.asset(AppImages.panel6),
        ),
        Positioned(
          left: 10,
          top: 11,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$level lvl',
                style: AppStyle.textStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              const SizedBox(
                width: 40,
                child: LinearProgressIndicator(
                  value: 0.4,
                  backgroundColor: AppColors.blue,
                  color: AppColors.yellow,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 6,
          top: 20,
          child: Text(
            '288864518',
            style: AppStyle.textStyle.copyWith(fontSize: 14),
          ),
        ),
        Positioned(
          left: 11,
          top: 48,
          child: Column(
            children: [
              Text(
                'ULTEM (U):',
                style: AppStyle.textStyle.copyWith(
                  fontSize: 10,
                  color: AppColors.blue,
                ),
              ),
              Text(
                'EARNIE (E)::',
                style: AppStyle.textStyle.copyWith(
                  fontSize: 10,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 18,
          top: 45,
          child: Column(
            children: [
              Text(
                'Stormc1oak',
                style: AppStyle.textStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              Image.asset(
                AppImages.code,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
