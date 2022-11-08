import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    Key? key,
    required this.index,
    required this.imageUrl,
    required this.name,
    required this.width,
  }) : super(key: key);

  final int index;
  final String imageUrl;
  final String name;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            // child: Image.network(
            //   imageUrl,
            //   width: width,
            //   fit: BoxFit.fitWidth,
            // ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: width * 0.1,
              width: double.infinity,
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
