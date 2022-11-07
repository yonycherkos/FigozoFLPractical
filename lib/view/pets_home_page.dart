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
        bottom: TabBar(
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
        title: const Text('Pets'),
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
                return PetCard(
                  index: index,
                  cardWidth: cardWidth,
                );
              },
            ),
          ),
          const Icon(Icons.directions_transit, size: 350),
        ],
      ),
    );
  }
}
