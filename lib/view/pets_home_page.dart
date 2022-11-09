import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Condition;
import 'package:responsive_framework/responsive_framework.dart';
import 'package:figozo_fl_practical/controller/pets_controller.dart';
import 'package:figozo_fl_practical/view/components/pets_gridview.dart';

class PetsHomePage extends StatefulWidget {
  static const String routeName = '/home';
  const PetsHomePage({super.key});

  @override
  State<PetsHomePage> createState() => _PetsHomePageState();
}

class _PetsHomePageState extends State<PetsHomePage>
    with TickerProviderStateMixin {
  final PetsController petsController = Get.put(PetsController());
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    petsController.onInit();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        if (petsController.catsList.isEmpty) petsController.getCatsList();
      } else {
        if (petsController.catsList.isEmpty) petsController.getDogsList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(child: buildTabBar()),
      ),
      body: Obx(() {
        return TabBarView(
          controller: _tabController,
          children: [
            PetsGridView(petsList: petsController.catsList.toList()),
            PetsGridView(petsList: petsController.dogsList.toList()),
          ],
        );
      }),
    );
  }

  Widget buildTabBar() {
    final screenWidth = MediaQuery.of(context).size.width;
    double tabBarWidth = ResponsiveValue(
      context,
      defaultValue: screenWidth,
      valueWhen: const [
        Condition.largerThan(
          name: TABLET,
          value: 500.0,
        )
      ],
    ).value!;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ResponsiveVisibility(
            hiddenWhen: [
              Condition.smallerThan(name: DESKTOP),
            ],
            child: Padding(
              padding: EdgeInsets.only(left: 36),
              child: Icon(
                Icons.pets,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: tabBarWidth,
            child: TabBar(
              controller: _tabController,
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              tabs: const [
                Tab(text: 'Cats'),
                Tab(text: 'Dogs'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
