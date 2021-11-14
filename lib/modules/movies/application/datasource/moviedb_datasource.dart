import 'package:dio/dio.dart';
import 'package:flutter_movies/modules/movies/domain/entities/similar_movies.dart';
import 'package:flutter_movies/modules/movies/infrastructure/datasources/movie_datasource.dart';
import 'package:flutter_movies/modules/movies/infrastructure/models/movie_model.dart';
import 'package:flutter_movies/modules/movies/infrastructure/models/similar_movie_model.dart';

class MovieDbDatasource implements MovieDatasource {
  Dio dio;

  MovieDbDatasource(this.dio);

  @override
  Future<MovieModel> getMovieById(int id) async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/550?api_key=f762b12aa5ec3b09e39664a9a0915134');
    MovieModel model = MovieModel.fromMap(response.data);
    return model;
  }

  @override
  Future<List<SimilarMovie>> getSimilarMovies(int id) async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/movie/550/similar?api_key=f762b12aa5ec3b09e39664a9a0915134');
    // List<SimilarMovie> r = [SimilarMovieModel.fromMap(response.data)];
    print(response.data);
    return [];
  }
}
