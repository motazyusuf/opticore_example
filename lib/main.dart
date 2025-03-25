import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:opticore/opticore.dart';
import 'package:opticore_example/core/routes/pages_routes.dart';

import 'core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/languages',
      supportedLocales: [Locale('en'), Locale('ar')],
      fallbackLocale: Locale("en"),
      startLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CoreSetup(
      appConfig: AppConfig(
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: PagesRoutes.splash,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
      ),
    );
  }
}
