import 'package:flutter/material.dart';
import 'package:list_of_products/presentation/productListScreen/ProductListScreen.dart';
import 'package:list_of_products/presentation/productListScreen/SearchAndCartComponent.dart';
import 'di/Di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        initialRoute: ProductListScreen.routeName,
      routes: {
        ProductListScreen.routeName: (_)=>
            ProductListScreen(),
      }
    );
  }
}


