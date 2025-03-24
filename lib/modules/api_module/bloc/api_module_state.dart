part of '../api_module_import.dart';

@immutable
sealed class ApiModuleState {}

final class ApiModuleInitial extends BaseState {}

final class ProductsLoaded extends RenderDataState {
  Products products;
  ProductsLoaded(this.products) : super(null);
}

final class ProductsLoading extends LoadingStateRender {}

final class ProductsAdding extends LoadingStateNonRender {}

final class ProductsAdded extends EndLoadingStateNonRender {}
