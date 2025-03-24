part of '../import/products_module_import.dart';

class ProductsModuleScreen extends StatefulWidget {
  final ProductsModuleBloc bloc;

  const ProductsModuleScreen({super.key, required this.bloc});

  @override
  ProductsModuleScreenState createState() => ProductsModuleScreenState(bloc);
}

class ProductsModuleScreenState
    extends BaseScreen<ProductsModuleBloc, ProductsModuleScreen, dynamic> {
  ProductsModuleScreenState(super.bloc);

  @override
  Widget buildWidget(BuildContext parentContext, RenderDataState state) {
    return Scaffold(
      body:
          state is ProductsLoaded
              ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.products?.products.length,
                      itemBuilder: (context, index) {
                        return Item(
                          product:
                              state.products?.products[index] ??
                              Product(
                                title: "title",
                                price: 0,
                                imageURL: "imageURL",
                              ),
                        );
                      },
                    ),
                  ),
                ],
              )
              : SizedBox(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colorScheme.primary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder:
                (context) => PostItemBottomSheet(
                  onAdd: (image, name, price) {
                    postEvent(
                      AddProductEvent(
                        Product(
                          imageURL: image ?? '',
                          title: name ?? '',
                          price: price ?? 0,
                        ),
                      ),
                    );
                  },
                ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void listenToState(BuildContext context, BaseState state) {}
}
