import 'package:figozo_fl_practical/model/pet_info.dart';
import 'package:flutter/material.dart';

class PetDescription extends StatelessWidget {
  const PetDescription({
    Key? key,
    required this.petInfo,
    this.alignment = CrossAxisAlignment.center,
  }) : super(key: key);

  final PetInfo petInfo;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          'Name: ${petInfo.name}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Age: ${petInfo.age}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Weight: ${petInfo.weight}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          children: [
            Text(
              petInfo.description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
