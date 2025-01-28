import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zesty/bloc/product/product_bloc.dart';
import 'package:zesty/data/response/response.dart';
import 'package:zesty/dependency_injection/service_locator.dart';
import 'package:zesty/view/home/widgets/home_header.dart';
import 'package:zesty/view/home/widgets/product_grid.dart';

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
                        HomeHeader(searchController: _searchController),
                        SizedBox(
                          height: 20,
                        ),
                        ProductGrid(productList: productList),
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
