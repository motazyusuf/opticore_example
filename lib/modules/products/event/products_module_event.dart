part of '../import/products_module_import.dart';

class ProductsModuleInitialEvent extends BaseEvent {}

class GetProductsEvent extends BaseEvent {}

class GetMoreProductsEvent extends BaseEvent {}

class AddProductEvent extends BaseEvent {
  Product product;

  AddProductEvent(this.product);
}
