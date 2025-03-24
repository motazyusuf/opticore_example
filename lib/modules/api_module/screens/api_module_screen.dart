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
  Widget buildWidget(BuildContext parentContext, RenderDataState state) {
    return Scaffold(
      body:
          state is ProductsLoading
              ? CircularProgressIndicator(
                color: Theme.of(context).indicatorColor,
              )
              : state is ProductsLoaded
              ? Column(
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
              )
              : SizedBox(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(parentContext).primaryColorLight,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder:
                (context) => PostItemBottomSheet(parentContext: parentContext),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void listenToState(BuildContext context, BaseState state) {
    if (state is ProductsAdded) {
      debugPrint("Done");
    }
  }
}
