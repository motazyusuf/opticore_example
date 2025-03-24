import 'package:opticore/opticore.dart';

import 'products_model.dart';

class ProductsModuleRepo extends BaseRepo {
  Future<ApiResponse<Products?>?> getData() async {
    ApiResponse<Products?>? response = await networkHelper?.request(
      "https://dummyjson.com/products",
      params: {"limit": 2, "skip": 0},
      (response) => Products.fromJson(response!),
      method: HTTPMethod.get,
    );
    return response;
  }

  Future<void> addProduct(Product product) async {
    await super.updateHeaders(
      onUpdate: (headers) async {
        final updatedHeaders = Map<String, String>.from(headers);
        updatedHeaders['content-type'] = 'application/json';
        return updatedHeaders;
      },
    );
    await networkHelper?.request(
      "https://dummyjson.com/products/add",
      (_) {},
      body: product.toJson(),
      method: HTTPMethod.post,
    );
  }
}
