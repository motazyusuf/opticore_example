part of '../api_module_import.dart';

class ApiModuleBloc extends BaseBloc {
  ApiModuleRepo apiRepo = ApiModuleRepo();

  ApiModuleBloc()
    : super(ApiModuleStateFactory(), initialState: ApiModuleInitial()) {
    on<ExampleModuleInitialEvent>(loadData);
  }

  @override
  void onDispose() {}

  Future<void> loadData(event, emit) async {
    Products products = await apiRepo.getData();
    emit(ProductsLoaded(products));
  }
}
