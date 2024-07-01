import 'package:dio/dio.dart';
import 'package:docdoc_project/core/network/api_service.dart';
import 'package:docdoc_project/core/network/dio_factory.dart';
import 'package:docdoc_project/features/login/data/repo/login_repo.dart';
import 'package:docdoc_project/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));

  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

}
