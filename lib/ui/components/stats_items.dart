import 'package:clicker/ui/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatsItems extends StatelessWidget {
  const StatsItems({
    super.key,
    required this.icon,
    required this.text,
    required this.result,
  });
  final String icon;
  final String text;
  final String result;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 9, right: 12),
      leading: SvgPicture.asset(icon),
      title: Text(
        text,
        style: AppStyle.textStyle.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: Text(
        result,
        style: AppStyle.textStyle.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
