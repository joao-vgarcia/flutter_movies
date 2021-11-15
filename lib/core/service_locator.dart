import 'package:dio/dio.dart';
import 'package:flutter_movies/core/api_client.dart';
import 'package:flutter_movies/modules/movies/domain/repositories/movie_repository_usecases.dart';
import 'package:flutter_movies/modules/movies/domain/usecases/get_movie.dart';
import 'package:flutter_movies/modules/movies/external/datasource/moviedb_datasource.dart';
import 'package:flutter_movies/modules/movies/infrastructure/datasources/movie_datasource.dart';
import 'package:flutter_movies/modules/movies/infrastructure/repositories/movie_repository.dart';
import 'package:flutter_movies/modules/movies/presenter/store/movie_details_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

init() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<GetMovie>(() => GetMovie(getIt()));
  getIt.registerLazySingleton<MovieDatasource>(() => MovieDbDatasource(getIt()));
  getIt.registerFactory<MovieRepositoryUsecases>(() => MovieRepository(getIt()));
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt()));


  getIt.registerLazySingleton<MovieDetailsStore>(() => MovieDetailsStore(getIt()));
}
