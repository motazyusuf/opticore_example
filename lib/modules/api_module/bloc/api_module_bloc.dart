part of '../api_module_import.dart';

class ApiModuleBloc extends BaseBloc {
  ApiModuleBloc()
      : super(
    ApiModuleStateFactory(),
    initialState: ApiModuleInitial(),
  );

  @override
  void onDispose() {}
}