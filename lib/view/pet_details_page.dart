import 'package:figozo_fl_practical/view/components/pet_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:responsive_framework/responsive_framework.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:figozo_fl_practical/model/pet_info.dart';

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
    final double imageWidth =
        responsiveWrapper.isLargerThan(TABLET) ? 600 : 450;

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
                    child: kIsWeb
                        ? Image.network(
                            petInfo.photo,
                            width: imageWidth,
                            fit: BoxFit.fitWidth,
                          )
                        : CachedNetworkImage(
                            imageUrl: petInfo.photo,
                            width: imageWidth,
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: PetDescription(
                      petInfo: petInfo,
                      alignment: CrossAxisAlignment.start,
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
                    child: kIsWeb
                        ? Image.network(
                            petInfo.photo,
                            width: imageWidth,
                            fit: BoxFit.fitWidth,
                          )
                        : CachedNetworkImage(
                            imageUrl: petInfo.photo,
                            width: imageWidth,
                            fit: BoxFit.fitWidth,
                          ),
                  ),
                  const SizedBox(height: 24),
                  PetDescription(petInfo: petInfo),
                ],
              ),
            ),
    );
  }
}
