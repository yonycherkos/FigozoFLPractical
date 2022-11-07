import 'package:flutter/material.dart';

class PetDetailPage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  const PetDetailPage({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 36, 12, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    height: screenSize.height * 0.35,
                    width: screenSize.width - 24,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
