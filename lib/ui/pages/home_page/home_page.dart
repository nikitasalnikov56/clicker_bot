import 'package:clicker/ui/components/custom_appbar_widget.dart';
import 'package:clicker/ui/managers/switch_screens/switching_screens_bloc.dart';
import 'package:clicker/ui/pages/basket_body/basket_body.dart';
import 'package:clicker/ui/pages/box_body/box_body.dart';
import 'package:clicker/ui/pages/map_body/map_body.dart';
import 'package:clicker/ui/pages/task_body/task_body.dart';
import 'package:clicker/ui/pages/user_body/user_body.dart';
import 'package:clicker/ui/resources/app_icons.dart';
import 'package:clicker/ui/resources/app_images.dart';
import 'package:clicker/ui/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchingScreensBloc()
        ..add(
          SwitchScreenEvent(
            currentIndex: 0,
            screen: const UserBody(),
          ),
        ),
      child: const ScaffoldWidget(),
    );
  }
}

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBarWidget(),
      body: BlocBuilder<SwitchingScreensBloc, SwitchingScreensState>(
        builder: (context, state) {
          final currentState =
              state is SwitchScreenState ? state.screen : const UserBody();
          return currentState;
        },
      ),
      bottomNavigationBar: const BottomWidget(),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      margin: const EdgeInsets.only(bottom: 45),
      height: 80,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImages.bottomLine,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 2,
          ),
          const BottomNavbarItems(),
        ],
      ),
    );
  }
}

class BottomNavbarItems extends StatelessWidget {
  const BottomNavbarItems({
    super.key,
  });
  static List<Widget> screens = [
    const UserBody(),
    const MapBody(),
    const BasketBody(),
    const BoxBody(),
    const TaskBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 55,
        width: double.infinity,
        child: CustomPaint(
          size: const Size(double.infinity, 55),
          painter: DiamondPainter(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: BlocBuilder<SwitchingScreensBloc, SwitchingScreensState>(
              builder: (context, state) {
                final currentIndex =
                    state is SwitchScreenState ? state.currentIndex : 0;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: BottomNavbarIcons.icons
                      .asMap()
                      .entries
                      .map(
                        (e) => Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                              color: currentIndex == e.key
                                  ? AppColors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                            onPressed: e.key !=
                                    BottomNavbarIcons.icons.length - 1
                                ? () {
                                    context.read<SwitchingScreensBloc>().add(
                                          SwitchScreenEvent(
                                            currentIndex: e.key,
                                            screen: screens[e.key],
                                          ),
                                        );
                                  }
                                : null,
                            icon: SvgPicture.asset(
                              e.value,
                              width: 30,
                              height: 30,
                              color: currentIndex == e.key
                                  ? AppColors.white
                                  : e.key != BottomNavbarIcons.icons.length - 1
                                      ? AppColors.black
                                      : AppColors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(52, 0);

    path.lineTo(52, 2.5);
//     path.arcTo(
//   const Rect.fromLTWH(50, 0, 5,5), // Прямоугольник для дуги
//   -pi / 2, // Начальный угол в радианах (90° вверх)
//   pi / 2, // Конечный угол дуги (90° вниз)
//   false, // Не делаем резкие углы
// );
    path.lineTo(59, 2.5);
    path.lineTo(59, 0);
    path.lineTo(235, 0);
    path.lineTo(235, 2.5);
    path.lineTo(253, 2.5);
    path.lineTo(253, 0);
    path.lineTo(360, 0);
    //вниз
    path.lineTo(360, 34);

    path.lineTo(340, 54);
    path.lineTo(59, 54);
    path.lineTo(59, 51.5);
    path.lineTo(55, 51.5);
    path.lineTo(55, 54);
    path.lineTo(52, 54);
    path.lineTo(52, 51.5);
    path.lineTo(49, 51.5);
    path.lineTo(49, 54);
    path.lineTo(0, 54);
    path.lineTo(0, 41);
    path.lineTo(4, 41);
    path.lineTo(4, 15);
    path.lineTo(0, 15);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
