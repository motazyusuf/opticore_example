part of '../api_module_import.dart';

class ApiModuleScreen extends StatefulWidget {
  final ApiModuleBloc bloc;

  const ApiModuleScreen({super.key, required this.bloc});

  @override
  ApiModuleScreenState createState() => ApiModuleScreenState(bloc);
}

class ApiModuleScreenState
    extends BaseScreen<ApiModuleBloc, ApiModuleScreen, dynamic> {
  ApiModuleScreenState(super.bloc);

  @override
  Widget buildWidget(BuildContext context, RenderDataState state) {
    return Container();
  }

  @override
  void listenToState(BuildContext context, BaseState state) {}
}
