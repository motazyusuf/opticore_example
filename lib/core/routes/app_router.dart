import 'package:flutter/material.dart';
import 'package:opticore_example/core/routes/pages_routes.dart';

import '../../modules/products/import/products_module_import.dart';
import '../../splash.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => Splash(),
          settings: settings,
        );
      case PagesRoutes.home:
        return MaterialPageRoute(
          builder:
              (context) => ProductsModuleScreen(bloc: ProductsModuleBloc()),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (context) => const Placeholder());
    }
  }
}
