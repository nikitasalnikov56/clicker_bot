import 'package:clicker/ui/components/stats_items.dart';
import 'package:clicker/ui/resources/app_icons.dart';
import 'package:clicker/ui/resources/app_images.dart';
import 'package:clicker/ui/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatsMenu extends StatelessWidget {
  const StatsMenu({
    super.key,
    required bool isMenuOpen,
    required AnimationController controller,
    required this.onTap,
  })  : _isMenuOpen = isMenuOpen,
        _controller = controller;

  final bool _isMenuOpen;
  final AnimationController _controller;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      right: _isMenuOpen ? 0 : -180,
      top: 0,
      bottom: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: onTap,
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
                child: SvgPicture.asset(
                  AppIcons.arrowBtn,
                ),
              ),
            ),
          ),
          Container(
            width: 180,
            height: 380,
            margin: const EdgeInsets.only(top: 20, bottom: 95),
            decoration: const BoxDecoration(
              // color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.menuBg,
                ),
              ),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 21.5),
                  child: Divider(
                    color: AppColors.blue,
                    thickness: 5,
                  ),
                ),
                Expanded(
                  child: StatsItems(
                    icon: AppIcons.stat1,
                    text: 'Power:',
                    result: '323',
                  ),
                ),
                Expanded(
                  child: StatsItems(
                    icon: AppIcons.stat2,
                    text: 'HP:',
                    result: '105',
                  ),
                ),
                Expanded(
                  child: StatsItems(
                    icon: AppIcons.stat3,
                    text: 'Damage:',
                    result: '45',
                  ),
                ),
                Expanded(
                  child: StatsItems(
                    icon: AppIcons.stat4,
                    text: 'CRT DMG:',
                    result: '51%',
                  ),
                ),
                Expanded(
                  child: StatsItems(
                    icon: AppIcons.stat5,
                    text: 'CRT CHN:',
                    result: '30%',
                  ),
                ),
                Expanded(
                  child: StatsItems(
                    icon: AppIcons.stat6,
                    text: 'Evasion:',
                    result: '1%',
                  ),
                ),
                Expanded(
                  child: StatsItems(
                    icon: AppIcons.stat7,
                    text: 'Accuracy:',
                    result: '80%',
                  ),
                ),
                Expanded(
                  child: StatsItems(
                    icon: AppIcons.stat8,
                    text: 'Armor:',
                    result: '10',
                  ),
                ),
                Expanded(
                  child: StatsItems(
                    icon: AppIcons.stat9,
                    text: 'CMPSTN:',
                    result: '0,1%',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
