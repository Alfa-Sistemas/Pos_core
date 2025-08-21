import 'package:get_it/get_it.dart';
import 'package:pos_core/data/datasource/pagbank/pagbank_datasource.dart';
import 'package:pos_core/data/datasource/pagbank/pagbank_datasource_impl.dart';
import 'package:pos_core/data/datasource/stone/stone_datasource.dart';
import 'package:pos_core/data/datasource/stone/stone_datasource_impl.dart';

Future<void> initInjectors() async {
  // Data
  final GetIt _getIt = GetIt.instance;
  _getIt.registerLazySingleton<StoneDatasource>(() => StoneDatasourceImpl());
  _getIt.registerLazySingleton<PagbankDatasource>(() => PagbankDatasourceImpl());
  // Repositories
  
  // Usecases
  
}

