import 'package:clicker/ui/components/subtitle_button.dart';
import 'package:clicker/ui/resources/app_images.dart';
import 'package:clicker/ui/style/app_colors.dart';
import 'package:clicker/ui/style/app_style.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(0),
      itemCount: 3,
      itemBuilder: (context, i) {
        return ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Container(
            width: 90,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.shopCards,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Image.asset(
                AppImages.key,
              ),
            ),
          ),
          title: Container(
            width: double.infinity,
            height: 25,
            padding: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.borderBlue.withOpacity(0.4),
              ),
              color: AppColors.blue.withOpacity(0.2),
            ),
            child: Text(
              '/ name /',
              textAlign: TextAlign.center,
              style: AppStyle.textStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                SubTitleButton(
                  text: 'buy',
                  image: AppImages.buy,
                  onTap: () {
                    print('buy');
                  },
                ),
                SubTitleButton(
                  text: 'UPGRADE',
                  image: AppImages.upgrade,
                  onTap: () {
                    print('UPGRADE');
                  },
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
