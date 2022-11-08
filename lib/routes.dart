import 'package:figozo_fl_practical/view/pet_details_page.dart';
import 'package:figozo_fl_practical/view/pets_home_page.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const String home = "/";
  static const String details = "/details";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return Routes.fadeThrough(settings, (context) {
      switch (settings.name) {
        case Routes.home:
          return const PetsHomePage();
        case Routes.details:
          var args = settings.arguments as PetDetailsPage;
          return PetDetailsPage(
            petInfo: args.petInfo,
          );
        default:
          return const SizedBox.shrink();
      }
    });
  }

  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 300}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
