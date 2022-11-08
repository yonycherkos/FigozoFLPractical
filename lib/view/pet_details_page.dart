import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:figozo_fl_practical/model/pet_info.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PetDetailsPage extends StatelessWidget {
  static const String routeName = '/details';

  final PetInfo petInfo;
  const PetDetailsPage({
    super.key,
    required this.petInfo,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveWrapper = ResponsiveWrapper.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pet Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: responsiveWrapper.isLargerThan(MOBILE)
          ? Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: petInfo.photo,
                      width: 400,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          petInfo.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          children: [
                            Text(petInfo.description),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: petInfo.photo,
                      width: 300,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    petInfo.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    children: [
                      Text(petInfo.description),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
