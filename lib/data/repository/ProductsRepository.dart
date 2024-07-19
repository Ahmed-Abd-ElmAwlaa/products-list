import 'package:injectable/injectable.dart';
import 'package:list_of_products/data/dataSourceContract/ProductDataSource.dart';
import 'package:list_of_products/domain/model/Product.dart';

import '../../domain/repository/ProductsRepository.dart';
@Injectable(as: ProductsRepository)
class ProductsRepositoryImp extends ProductsRepository{
  ProductDataSource productDataSource;
  @factoryMethod ProductsRepositoryImp(this.productDataSource);
  @override
  Future<List<Product>?> getProduct() {
    return productDataSource.getProduct();
  }

}