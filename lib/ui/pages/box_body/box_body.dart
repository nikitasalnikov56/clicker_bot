import 'package:clicker/ui/components/tab_item.dart';
import 'package:clicker/ui/resources/app_images.dart';
import 'package:flutter/material.dart';

class BoxBody extends StatefulWidget {
  const BoxBody({super.key});

  @override
  State<BoxBody> createState() => _BoxBodyState();
}

class _BoxBodyState extends State<BoxBody> with SingleTickerProviderStateMixin {
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
              children: [
                GridItem(
                  tabController: tabController,
                ),
                GridItem(
                  tabController: tabController,
                ),
                GridItem(
                  tabController: tabController,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.tabController,
  });
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 22,
        crossAxisSpacing: 22,
      ),
      itemCount: 9,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            width: 90,
            height: 70,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.shopCards,
                ),
              ),
            ),
            child: Center(
              child: Image.asset(
                tabController.index == 1 && i == 0
                    ? AppImages.gun
                    : AppImages.key,
              ),
            ),
          ),
        );
      },
    );
  }
}
