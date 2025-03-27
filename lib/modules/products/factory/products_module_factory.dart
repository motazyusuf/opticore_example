part of '../import/products_module_import.dart';

class ProductsModuleStateFactory extends BaseFactory {
  @override
  BaseState getState<M>(M data) {
    if (data is Products) {
      return ProductsLoaded(null);
    }
    return DefaultState();
  }
}