import 'package:injectable/injectable.dart';
import 'package:list_of_products/data/api/apiManager/ApiManager.dart';
import 'package:list_of_products/domain/model/Product.dart';

import '../dataSourceContract/ProductDataSource.dart';
@Injectable(as: ProductDataSource)
class ProductOnlineDataSource extends ProductDataSource{
  ApiManager apiManager;
  @factoryMethod ProductOnlineDataSource(this.apiManager);
  @override
  Future<List<Product>?> getProduct() async{
    var response = await apiManager.getProduct();
    return response.products?.map((productDto) => productDto.toProduct()).toList();
  }

}