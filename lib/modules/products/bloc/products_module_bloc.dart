part of '../import/products_module_import.dart';

class ProductsModuleBloc extends BaseBloc {
  final ScrollController scrollController = ScrollController();
  int skips = 0;
  bool loading = false;
  ProductsModuleRepo apiRepo = ProductsModuleRepo();

  ProductsModuleBloc()
    : super(
        ProductsModuleStateFactory(),
        initialState: ProductsInitialState(),
      ) {
    on<GetProductsEvent>(loadData);
    on<AddProductEvent>(addData);
    on<GetMoreProductsEvent>(loadMoreData);
    add(GetProductsEvent());
    scrollController.addListener(() {
      add(GetMoreProductsEvent());
    });
  }

  Future<void> loadData(GetProductsEvent event, Emitter emit) async {
    // emit(LoadingStateNonRender());
    ApiResponse<Products?>? response = await apiRepo.getData(skips);
    emit(handleApiResponse(response, retryFunc: () => add(event)));
    // emit(EndLoadingStateNonRender());
  }

  Future<void> addData(AddProductEvent event, Emitter emit) async {
    emit(LoadingStateNonRender());
    ApiResponse? response = await apiRepo.addProduct(event.product);
    emit(handleApiResponse(response, retryFunc: () => add(event)));
    emit(EndLoadingStateNonRender());
  }

  Future<void> loadMoreData(GetMoreProductsEvent event, Emitter emit) async {
    loading = true;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      skips += 2;
      ApiResponse<Products?>? response = await apiRepo.getData(skips);
      final currentState = state as ProductsLoaded;
      response?.data?.products =
          (currentState.products!.products + response.data!.products);
      emit(handleApiResponse(response, retryFunc: () => add(event)));
    }
  }
}
