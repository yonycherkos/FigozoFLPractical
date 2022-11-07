import 'package:figozo_fl_practical/view/pet_detail_page.dart';
import 'package:flutter/material.dart';

import 'components/pet_card.dart';

class PetsHomePage extends StatefulWidget {
  const PetsHomePage({super.key});

  @override
  State<PetsHomePage> createState() => _PetsHomePageState();
}

class _PetsHomePageState extends State<PetsHomePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(child: buildTabBar()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(8, 24, 8, 0),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                var cardWidth = screenWidth / 2 - 12;
                var imageUrl = 'https://picsum.photos/id/237/200/300';
                var description =
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PetDetailPage(
                        imageUrl: imageUrl,
                        name: 'Cat${index + 1}',
                        description: description,
                      );
                    }));
                  },
                  child: PetCard(
                    index: index,
                    imageUrl: imageUrl,
                    name: 'Cat${index + 1}',
                    cardWidth: cardWidth,
                  ),
                );
              },
            ),
          ),
          const Icon(Icons.directions_transit, size: 350),
        ],
      ),
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
