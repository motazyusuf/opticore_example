part of '../import/products_module_import.dart';

class ProductsModuleStateFactory extends BaseFactory {
  @override
  BaseState getState<M>(M data) {
    return DefaultState();
  }
}