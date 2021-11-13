import 'package:dartz/dartz.dart';
import 'package:flutter_movies/modules/get_movies/domain/entities/movie.dart';
import 'package:flutter_movies/modules/get_movies/domain/errors/errors.dart';

abstract class MovieRepositoryUsecases {
  Future<Either<FailureMovie, Movie>> getMovieById(int id);
  Future<Either<FailureMovie, List<Movie>>> getSimilarMovies(int id);
}
