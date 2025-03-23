part of '../api_module_import.dart';

class ApiModuleScreen extends StatefulWidget {
  final ApiModuleBloc bloc;

  const ApiModuleScreen({super.key, required this.bloc});

  @override
  ApiModuleScreenState createState() => ApiModuleScreenState(bloc);
}

class ApiModuleScreenState
    extends BaseScreen<ApiModuleBloc, ApiModuleScreen, dynamic> {
  ApiModuleScreenState(super.bloc);

  @override
  Widget buildWidget(BuildContext context, RenderDataState state) {
    if (state is ProductsLoaded) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.products.products.length,
                itemBuilder: (context, index) {
                  return Item(product: state.products.products[index]);
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return SizedBox();
    }
  }

  @override
  void listenToState(BuildContext context, BaseState state) {}
}
