part of '../api_module/api_module_import.dart';
class ApiModuleStateFactory extends BaseFactory {
  @override
  BaseState getState<M>(M data) {
    return DefaultState();
  }
}