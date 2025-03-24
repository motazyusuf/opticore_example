part of '../import/products_module_import.dart';

class ProductsModuleBloc extends BaseBloc {
  ProductsModuleRepo apiRepo = ProductsModuleRepo();

  ProductsModuleBloc()
    : super(
        ProductsModuleStateFactory(),
        initialState: ProductsInitialState(),
      ) {
    on<GetProductsEvent>(loadData);
    on<AddProductEvent>(addData);
    add(GetProductsEvent());
  }

  Future<void> loadData(GetProductsEvent event, Emitter emit) async {
    emit(LoadingStateNonRender());

    ApiResponse<Products?>? response = await apiRepo.getData();
    if (response?.type == ApiResponseType.success) {
      emit(ProductsLoaded(response?.data));
    }

    // handleApiResponse(response, retryFunc: () => add(event));

    emit(EndLoadingStateNonRender());
  }

  Future<void> addData(AddProductEvent event, Emitter emit) async {
    emit(LoadingStateNonRender());
    await apiRepo.addProduct(event.product);
    emit(EndLoadingStateNonRender());
  }
}
