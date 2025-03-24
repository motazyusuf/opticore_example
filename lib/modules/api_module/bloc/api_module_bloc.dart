part of '../api_module_import.dart';

class ApiModuleBloc extends BaseBloc {
  ApiModuleRepo apiRepo = ApiModuleRepo();

  ApiModuleBloc()
    : super(ApiModuleStateFactory(), initialState: ApiModuleInitial()) {
    on<ApiModuleInitialEvent>(loadData);
    on<AddProductEvent>(addData);
  }

  @override
  void onDispose() {}

  Future<void> loadData(event, emit) async {
    emit(ProductsLoading());
    Products products = await apiRepo.getData();
    emit(ProductsLoaded(products));
  }

  Future<void> addData(event, emit) async {
    // emit(ProductsAdding());
    if (event is AddProductEvent) {
      await apiRepo.addProduct(event.product);
    }
    emit(ProductsAdded());
  }
}
