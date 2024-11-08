import 'package:clicker/ui/resources/app_images.dart';
import 'package:clicker/ui/style/app_colors.dart';
import 'package:clicker/ui/style/app_style.dart';
import 'package:flutter/material.dart';

class MapBody extends StatelessWidget {
  const MapBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppImages.bg),
        ),
      ),
      padding: const EdgeInsets.only(top: 38),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 40,
          mainAxisExtent: 160,
        ),
        itemBuilder: (context, i) {
          return Container(
            width: 126,
            height: 159,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(
                  i > 0 ? AppImages.lockedCard : AppImages.card,
                ),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 8,
                  child: Image.asset(
                    i > 0 ? AppImages.lockedMask : AppImages.scene1,
                  ),
                ),
                i > 0
                    ? Positioned(
                        top: 48,
                        bottom: 75,
                        child: Image.asset(
                          AppImages.key,
                        ),
                      )
                    : const SizedBox.shrink(),
                Positioned(
                  top: 5,
                  child: Text(
                    i > 0 ? '0%' : '30%',
                    style: AppStyle.textStyle.copyWith(
                      color: i > 0 ? AppColors.white : AppColors.fullBlack,
                      fontSize: 12,
                      fontFamily: 'CourierPrime',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 54,
                  child: Text(
                    ':/// ${i > 0 ? '0000' : '0022'}',
                    style: AppStyle.textStyle.copyWith(
                      color: AppColors.white,
                      fontSize: 5,
                      fontFamily: 'CourierPrime',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 53,
                  right: 48,
                  child: Image.asset(
                    AppImages.decor1,
                    color: i > 0 ? AppColors.lockedGrey : AppColors.black,
                  ),
                ),
                Positioned(
                  bottom: 69,
                  left: 55,
                  child: Image.asset(
                    AppImages.qr,
                    color: i > 0 ? AppColors.lockedGrey : AppColors.black,
                  ),
                ),
                Positioned(
                  bottom: 38,
                  left: 50,
                  child: Text(
                    ':/// ${i > 0 ? 'locked' : 'SHOOTING'}'.toUpperCase(),
                    style: AppStyle.textStyle.copyWith(
                      color: i > 0 ? AppColors.lockedGrey : AppColors.white,
                      fontSize: 10,
                      fontFamily: 'CourierPrime',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 14,
                  child: Text(
                    '[ ${i > 0 ? '??? ??? ????' : 'Brawl in Kabuki'} ]',
                    style: AppStyle.textStyle.copyWith(
                      color: i > 0 ? AppColors.lockedGrey : AppColors.fullBlack,
                      fontSize: 10,
                      fontFamily: 'CourierPrime',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          );
          // Stack(
          //   alignment: Alignment.topCenter,
          //   children: [
          //     SvgPicture.asset(AppIcons.card),
          //   ],
          // );
        },
        itemCount: 6,
      ),
    );
  }
}
