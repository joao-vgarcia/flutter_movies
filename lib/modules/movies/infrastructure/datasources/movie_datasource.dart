import 'package:flutter_movies/modules/movies/domain/entities/similar_movies.dart';
import 'package:flutter_movies/modules/movies/infrastructure/models/movie_model.dart';

abstract class MovieDatasource {
  Future<MovieModel> getMovieById(int id);
  Future<List<SimilarMovie>> getSimilarMovies(int id);
}
