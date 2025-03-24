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
