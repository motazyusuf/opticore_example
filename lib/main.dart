import 'package:flutter/material.dart';
import 'package:opticore_example/modules/api_module/api_module_import.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ApiModuleScreen(bloc: ApiModuleBloc()
        ..add(ExampleModuleInitialEvent())),
    );
  }
}

