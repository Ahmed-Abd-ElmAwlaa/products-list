import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'dart:convert';
import '../../model/products/ProductsResponse.dart';

@singleton
@injectable
class ApiManager {
  static const String baseUrl = "dummyjson.com";

  Future<ProductsResponse> getProduct() async {
    var url = Uri.https(baseUrl, "products");
    var response = await http.get(url);
    var productResponse = ProductsResponse.fromJson(
        jsonDecode(response.body)
    );
    return productResponse;
  }
}