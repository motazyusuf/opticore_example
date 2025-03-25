import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:opticore/opticore.dart';
import 'package:opticore_example/core/constants/my_strings.dart';
import 'package:opticore_example/core/routes/pages_routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      MaintenanceConfig.instantiate(
        MaintenanceConfig(
          customMessage: MyStrings.appUnavailable.tr(),
          customMessageButton: MyStrings.tryAgain.tr(),
          customMessageRetryToast: MyStrings.retrying.tr(),
        ),
      );
      ApiResponseConfig.instantiate(
        ApiResponseConfig(
          customErrorMessage: MyStrings.errorOccurred.tr(),
          customNetworkIssuesMessage: MyStrings.networkIssueDetected.tr(),
          customRequestTimeoutMessage: MyStrings.requestTimedOut.tr(),
        ),
      );
      NoInternetConfig.instantiate(
        NoInternetConfig(
          customMessage: MyStrings.noInternetMessage.tr(),
          customMessageButton: MyStrings.retry.tr(),
        ),
      );
      Navigator.pushReplacementNamed(context, PagesRoutes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("Splash", style: TextStyle(fontSize: 30))),
    );
  }
}
