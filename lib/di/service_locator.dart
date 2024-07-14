import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:loayelhamaky_route_task/core/api/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api/api_consumer.dart';
import '../features/products/data/repos/product_repo.dart';
import '../features/products/presentation/cubit/product_cubit.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => Dio(BaseOptions(baseUrl: Endpoints.baseUrl)));
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl<Dio>()));

  sl.registerLazySingleton(() => ProductRepository(sl<ApiConsumer>()));

  sl.registerFactory(() => ProductCubit(sl<ProductRepository>()));
}
