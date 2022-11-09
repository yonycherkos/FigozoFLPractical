import 'package:figozo_fl_practical/model/pet_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cached_network_image/cached_network_image.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    Key? key,
    required this.petInfo,
    required this.width,
  }) : super(key: key);

  final PetInfo petInfo;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: kIsWeb
                ? Image.network(
                    petInfo.photo,
                    width: width,
                    fit: BoxFit.fitWidth,
                  )
                : CachedNetworkImage(
                    imageUrl: petInfo.photo,
                    width: width,
                    fit: BoxFit.fitWidth,
                  ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              width: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Name: ${petInfo.name}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Age: ${petInfo.age}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
