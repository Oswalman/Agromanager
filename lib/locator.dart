import 'package:get_it/get_it.dart';
import './core/services/api.dart';
import './core/viewmodels/CRUDModel.dart';
import './core/viewmodels/TipoInsumoCrud.dart';
import './core/viewmodels/ProductoCrud.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => CRUDTipoInsumo());
  locator.registerLazySingleton(() => CRUDProducto());
}
