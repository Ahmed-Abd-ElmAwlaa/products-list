// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/apiManager/ApiManager.dart' as _i3;
import '../data/dataSource/ProductOnlineDataSource.dart' as _i5;
import '../data/dataSourceContract/ProductDataSource.dart' as _i4;
import '../data/repository/ProductsRepository.dart' as _i7;
import '../domain/repository/ProductsRepository.dart' as _i6;
import '../domain/useCase/GetProductsUseCase.dart' as _i8;
import '../presentation/productListScreen/productListScreenViewModel.dart'
    as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.ProductDataSource>(
        () => _i5.ProductOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductsRepository>(
        () => _i7.ProductsRepositoryImp(gh<_i4.ProductDataSource>()));
    gh.factory<_i8.GetProductsUseCase>(
        () => _i8.GetProductsUseCase(gh<_i6.ProductsRepository>()));
    gh.factory<_i9.ProductListScreenViewModel>(
        () => _i9.ProductListScreenViewModel(gh<_i8.GetProductsUseCase>()));
    return this;
  }
}
