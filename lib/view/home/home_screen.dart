import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zesty/bloc/product/product_bloc.dart';
import 'package:zesty/data/response/response.dart';
import 'package:zesty/dependency_injection/service_locator.dart';

import 'widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductBloc productBloc;

  final _searchController = TextEditingController();

  @override
  void initState() {
    productBloc = ProductBloc(productApiRepository: getIt());
    super.initState();
  }

  @override
  void dispose() {
    productBloc.close();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocProvider(
            create: (context) => productBloc..add(FetchProducts()),
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                switch (state.productList.status) {
                  case Status.loading:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.completed:
                    final productList = state.productList.data!;
                    return Column(
                      // spacing: 20,
                      children: [
                        TextFormField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            hintText: "Search",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          onChanged: (value) {
                            context
                                .read<ProductBloc>()
                                .add(SearchProduct(value));
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: GridView.builder(
                            itemCount: productList.products.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 0.7,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 16,
                            ),
                            itemBuilder: (context, index) {
                              final product = productList.products[index];
                              return ProductCard(
                                product: product,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  case Status.error:
                    return Center(
                      child: Text(state.productList.message.toString()),
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
