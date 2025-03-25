part of '../import/products_module_import.dart';

final class ProductsInitialState extends RenderDataState {
  ProductsInitialState() : super(null);
}

// final class ProductsLoaded extends RenderDataState {
//   Products? products;
//   ProductsLoaded(this.products) : super(null);
// }

final class ProductsLoaded extends RenderDataState {
  ProductsLoaded(super.data);
}

final class MoatazState extends NonRenderState {
  final String message;

  MoatazState(this.message);
}
