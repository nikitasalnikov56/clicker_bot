import 'package:clicker/ui/style/app_style.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: const Color(0xFF3DFFFB),
      indicatorPadding: const EdgeInsets.only(bottom: 25),
      tabs: [
        Tab(
          icon: Text(
            'CLOTHES'.toUpperCase(),
            style: AppStyle.textStyle.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Tab(
          icon: Text(
            'WEAPONS'.toUpperCase(),
            style: AppStyle.textStyle.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Tab(
          icon: Text(
            'IMPLANTS'.toUpperCase(),
            style: AppStyle.textStyle.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

