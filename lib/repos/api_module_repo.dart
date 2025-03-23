import 'package:opticore/opticore.dart';

import '../modules/api_module/products_model.dart';

class ApiModuleRepo extends BaseRepo {
  Future<Products> getData() async {
    final response = await networkHelper?.request<Products>(
      "https://dummyjson.com/products",
      (response) => Products.fromJson(response!),
      method: HTTPMethod.get,
    );
    return response!.data!;
  }
}
