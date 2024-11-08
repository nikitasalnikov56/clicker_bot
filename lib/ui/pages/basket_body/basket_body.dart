import 'package:clicker/ui/components/list_widget.dart';
import 'package:clicker/ui/components/tab_item.dart';
import 'package:clicker/ui/resources/app_images.dart';
import 'package:flutter/material.dart';

class BasketBody extends StatefulWidget {
  const BasketBody({super.key});

  @override
  State<BasketBody> createState() => _BasketBodyState();
}

class _BasketBodyState extends State<BasketBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppImages.bg),
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 190, left: 24, right: 24),
      child: Column(
        children: [
          Container(
            height: 90,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AppImages.tabContainer,
                ),
              ),
            ),
            child: TabItem(tabController: tabController),
          ),
          const SizedBox(height: 17),
          Flexible(
            child: TabBarView(
              controller: tabController,
              children:const [
                 ListWidget(),
                 ListWidget(),
                 ListWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

