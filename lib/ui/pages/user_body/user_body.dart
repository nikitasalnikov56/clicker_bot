import 'package:clicker/ui/components/menu_items.dart';
import 'package:clicker/ui/components/menu_line.dart';
import 'package:clicker/ui/components/positioned_menu.dart';
import 'package:clicker/ui/components/stats_menu.dart';
import 'package:clicker/ui/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class UserBody extends StatefulWidget {
  const UserBody({super.key});

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody>
    with SingleTickerProviderStateMixin {
  bool _isMenuOpen = false;
  late AnimationController _controller;
// Flutter3DController controller = Flutter3DController();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double angle = -45 * (3.14159 / 180);
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 24, right: 24, top: 200),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.bg),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const SizedBox(
                  width: 180,
                  height: 470,
                  child: Flutter3DViewer(
                    src: 'assets/3dmodel/character.glb',
                  ),
                ),
                Opacity(
                  opacity: _isMenuOpen ? 0 : 1,
                  child: SizedBox(
                    width: 157,
                    height: 265,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const MenuItems(),
                        MenuLIne(
                          angle: angle,
                          top: 65,
                          left: 0,
                        ),
                        MenuLIne(
                          angle: angle,
                          bottom: 50,
                          right: 20,
                        ),
                        MenuLIne(
                          angle: -angle,
                          bottom: 45,
                          left: 20,
                        ),
                        MenuLIne(
                          angle: -angle,
                          top: 45,
                          right: 25,
                        ),
                        const PositionedMenu(
                          top: 0,
                          right: 56.14,
                        ),
                        const PositionedMenu(
                          top: 52,
                          left: 0,
                        ),
                        const PositionedMenu(
                          top: 52,
                          right: 5,
                        ),
                        const PositionedMenu(
                          bottom: 0,
                          right: 56.14,
                        ),
                        const PositionedMenu(
                          bottom: 52,
                          left: 0,
                        ),
                        const PositionedMenu(
                          bottom: 52,
                          right: 5,
                        ),
                      ],
                    ),
                  ),
                )
             
              ],
            ),
            StatsMenu(
              isMenuOpen: _isMenuOpen,
              controller: _controller,
              onTap: _toggleMenu,
            ),
          ],
        ),
      ),
    );
  }
}
