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
  ScaffoldConfig get scaffoldConfig => ScaffoldConfig(
    floatingActionButton: FloatingActionButton(
      backgroundColor: context.colorScheme.inversePrimary,
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

  @override
  bool? get ignoreSafeArea => true;

  @override
  Widget buildWidget(BuildContext parentContext, RenderDataState state) {
    return state is ProductsLoaded
        // ? bloc.products.isNotEmpty
        ? Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: bloc.scrollController,
                itemCount: bloc.products.length,
                itemBuilder: (context, index) {
                  print(">>>>>>>>>>>>>>>>>>${bloc.products.length}");
                  return Item(product: bloc.products[index]);
                },
              ),
            ),
          ],
        )
        // : Text("No Items")
        : SizedBox();
    // floatingActionButton: FloatingActionButton(
    //   backgroundColor: context.colorScheme.inversePrimary,
    //   onPressed: () {
    //     showModalBottomSheet(
    //       context: context,
    //       builder:
    //           (context) => PostItemBottomSheet(
    //             onAdd: (image, name, price) {
    //               postEvent(
    //                 AddProductEvent(
    //                   Product(
    //                     imageURL: image ?? '',
    //                     title: name ?? '',
    //                     price: price ?? 0,
    //                   ),
    //                 ),
    //               );
    //             },
    //           ),
    //     );
    //   },
    //   child: Icon(Icons.add),
    // )
  }

  @override
  void listenToState(BuildContext context, BaseState state) {}
}
