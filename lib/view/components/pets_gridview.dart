import 'package:flutter/material.dart';
import 'package:figozo_fl_practical/model/pet_info.dart';
import 'package:figozo_fl_practical/view/components/pet_card.dart';
import 'package:figozo_fl_practical/view/pet_details_page.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class PetsGridView extends StatelessWidget {
  const PetsGridView({
    Key? key,
    required this.petsList,
  }) : super(key: key);
  final List<PetInfo> petsList;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final responsiveWrapper = ResponsiveWrapper.of(context);
    double padding = responsiveWrapper.isDesktop ? 64 : 12;
    final cardWidth = screenWidth / 2 - padding;

    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: petsList.length,
        padding: EdgeInsets.all(padding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: responsiveWrapper.isLargerThan(TABLET) ? 3 : 2,
          crossAxisSpacing: padding,
          mainAxisSpacing: padding,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          var petInfo = petsList[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => PetDetailsPage(petInfo: petInfo));
            },
            child: PetCard(
              petInfo: petInfo,
              width: cardWidth,
            ),
          );
        },
      ),
    );
  }
}
