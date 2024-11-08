import 'package:clicker/ui/resources/app_images.dart';
import 'package:flutter/material.dart';

class TaskBody extends StatelessWidget {
  const TaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.bg),
          ),
        ),
    );
  }
}
