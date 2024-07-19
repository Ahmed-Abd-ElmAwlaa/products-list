import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:list_of_products/domain/model/Product.dart';
import '../../domain/useCase/GetProductsUseCase.dart';


@injectable
class ProductListScreenViewModel extends
Cubit<ProductListScreenState>{
  GetProductsUseCase getProductsUseCase;
  @factoryMethod ProductListScreenViewModel(
      this.getProductsUseCase)
      :super(Loading());
  void initPage()async{
    emit(Loading());
    try{
      var products = await getProductsUseCase.invoke();
      emit(Success(products));
    }catch(e){
      emit(Error(e.toString()));
    }
  }
}
sealed class ProductListScreenState{}
class Loading extends ProductListScreenState{

}
class Error extends ProductListScreenState{
  String? message;
  Error([this.message]);
}
class Success extends ProductListScreenState{
  List<Product>?product;
  Success(this.product);

}