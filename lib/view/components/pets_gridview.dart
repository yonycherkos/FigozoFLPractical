import 'package:flutter/material.dart';
import 'package:figozo_fl_practical/model/pet_info.dart';
import 'package:figozo_fl_practical/view/components/pet_card.dart';
import 'package:figozo_fl_practical/view/pet_details_page.dart';
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

    return GridView.builder(
      shrinkWrap: true,
      itemCount: petsList.length,
      padding: EdgeInsets.all(padding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            (responsiveWrapper.isDesktop || responsiveWrapper.isTablet) ? 3 : 2,
        crossAxisSpacing: padding,
        mainAxisSpacing: padding,
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
                  return PetDetailsPage(petInfo: petInfo);
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
