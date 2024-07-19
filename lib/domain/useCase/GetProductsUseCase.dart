import 'package:injectable/injectable.dart';
import 'package:list_of_products/data/model/products/ProductDto.dart';
import 'package:list_of_products/domain/model/Product.dart';
import 'package:list_of_products/domain/repository/ProductsRepository.dart';

@injectable
class GetProductsUseCase {
  ProductsRepository repository;
  @factoryMethod GetProductsUseCase(this.repository);
  Future<List<Product>?> invoke(){
    return repository.getProduct();
  }
}