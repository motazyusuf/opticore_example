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
        appBar: AppBar(title: Text("Products")),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.products.products.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    height: 500,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      // image: DecorationImage(
                      //   image: NetworkImage(
                      //     state.products.products[index].imageURL,
                      //   ),
                      // ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            state.products.products[index].imageURL,
                          ),
                          Text(
                            state.products.products[index].title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${state.products.products[index].price}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
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
