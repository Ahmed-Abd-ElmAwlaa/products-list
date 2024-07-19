import '../../domain/model/Product.dart';

abstract class ProductDataSource{
  Future<List<Product>?> getProduct();
}