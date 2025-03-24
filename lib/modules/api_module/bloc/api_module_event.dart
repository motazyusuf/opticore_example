part of '../api_module_import.dart';

class ApiModuleInitialEvent extends BaseEvent {}

class AddProductEvent extends BaseEvent {
  Product product;

  AddProductEvent(this.product);
}
