import 'package:dartz/dartz.dart';
import 'package:flutter_movies/modules/movies/domain/entities/movie.dart';
import 'package:flutter_movies/modules/movies/domain/entities/similar_movies.dart';
import 'package:flutter_movies/modules/movies/domain/errors/errors.dart';

abstract class MovieRepositoryUsecases {
  Future<Either<FailureMovie, Movie>> getMovieById(int id);
  Future<Either<FailureMovie, List<SimilarMovie>>> getSimilarMovies(int id);
}
