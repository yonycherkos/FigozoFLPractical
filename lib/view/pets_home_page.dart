import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:figozo_fl_practical/model/pet_info.dart';
import 'package:figozo_fl_practical/controller/pets_controller.dart';
import 'package:figozo_fl_practical/view/pet_detail_page.dart';

import 'components/pet_card.dart';

class PetsHomePage extends StatefulWidget {
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
    _tabController = TabController(length: 2, vsync: this);
    petsController.onInit();
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
    return Align(
      alignment: Alignment.bottomCenter,
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
    );
  }
}

class PetsGridView extends StatelessWidget {
  const PetsGridView({
    Key? key,
    required this.petsList,
  }) : super(key: key);
  final List<PetInfo> petsList;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth / 2 - 16;

    return GridView.builder(
      shrinkWrap: true,
      itemCount: petsList.length,
      padding: const EdgeInsets.fromLTRB(8, 24, 8, 50),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        var petInfo = petsList[index];
        return GestureDetector(
          onTap: () {
            // TODO: Use getx.go()
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PetDetailPage(petInfo: petInfo);
                },
              ),
            );
          },
          child: PetCard(
            index: index,
            imageUrl: petInfo.photo,
            name: petInfo.name,
            width: cardWidth,
          ),
        );
      },
    );
  }
}
