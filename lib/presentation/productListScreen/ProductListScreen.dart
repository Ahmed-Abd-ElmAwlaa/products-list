import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_of_products/domain/model/Product.dart';
import 'package:list_of_products/presentation/productListScreen/productListScreenViewModel.dart';
import '../../di/Di.dart';
import 'ProductComponent.dart';
import 'SearchAndCartComponent.dart';

class ProductListScreen extends StatefulWidget {
  static const String routeName = "Product list screen";

  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  ProductListScreenViewModel viewModel =
  getIt<ProductListScreenViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.initPage();
  }
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<ProductListScreenViewModel,
          ProductListScreenState>(
        bloc: viewModel,
        // buildWhen: (previous, current) {
        //   if(current is Error)return false;
        //   if(current is Loading)return false;
        //   return true;
        // },
        // listenWhen: (previous, current) {
        //   if(current is Error)return true;
        //   if(current is Loading)return true;
        //   return false;
        // },
        builder: (context, state) {
          if(state is Success){
           // return buildSuccessWidget(state.product??[]);
            Scaffold(
              appBar: AppBar(title: const Text("Success")),
              body: const Center(child: CircularProgressIndicator()),
            );
          }
          return Scaffold(
            appBar: AppBar(title: const Text("Not Success")),
            body: const Center(child: CircularProgressIndicator()),
          );
        },
        listener: (context, state) {

        },
        // listener: (BuildContext context, ProductListScreenState state) {
        //   if(state is Loading){}
        //   if(state is Error){}
        // },
      );
  }
  Widget buildSuccessWidget(List<Product> products){
    return   Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset("assets/Group 5.png",),

            ),
            const SizedBox(
              height: 10,
            ),
            const SearchAndCartComponent(),
            Expanded(
              child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount
                  (
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.8
                ),

                itemCount:products.length ,
                itemBuilder: (context, index) {
                  return ProductComponent(products[index]);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }



}
      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 12),
      //   child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           SizedBox(
      //             height: 60.,
      //           ),
      //
      //           // Logo App
      //           Image.asset(
      //             AppAssets.appLogoSvg,
      //             width: 70.,
      //           ),
      //
      //           SizedBox(
      //             height: 10.h,
      //           ),
      //
      //           // Search Product And Add Product To Cart
      //           SearchAndCartComponent(
      //             cubit: cubit,
      //           ),
      //
      //
      //
      //           // Products View
      //           Expanded(
      //             child: GridView.builder(
      //               gridDelegate:
      //               const SliverGridDelegateWithFixedCrossAxisCount(
      //                   crossAxisCount: 2,
      //                   crossAxisSpacing: 8.0,
      //                   mainAxisSpacing: 10.0,
      //                   childAspectRatio: 0.8),
      //               itemCount: cubit.search!.length,
      //               itemBuilder: (context, index) {
      //                 return ProductComponent(
      //                   image:
      //                   cubit.search![index].images.first.toString(),
      //                   name: cubit.search![index].title,
      //                   description: cubit.search![index].description,
      //                   price: cubit.search![index].discountPercentage
      //                       .toString(),
      //                   desPrice: cubit.search![index].price.toString(),
      //                   rate: cubit.search![index].rating.toString(),
      //                 );
      //               },
      //             ),
      //           ),
      //         ],
      //       );
      //     },
      //   ),
      // ),
