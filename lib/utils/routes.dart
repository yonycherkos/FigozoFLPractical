import 'package:figozo_fl_practical/view/pet_details_page.dart';
import 'package:figozo_fl_practical/view/pets_home_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PetsHomePage.routeName:
        return MaterialPageRoute(
          builder: ((context) => const PetsHomePage()),
        );
      case PetDetailsPage.routeName:
        final args = settings.arguments as PetDetailsPage;
        return MaterialPageRoute(
          builder: ((context) => PetDetailsPage(petInfo: args.petInfo)),
        );
      default:
        return MaterialPageRoute(
          builder: ((context) => const PetsHomePage()),
        );
    }
  }
}
