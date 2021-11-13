import 'package:flutter_movies/modules/get_movies/domain/errors/errors.dart';
import 'package:flutter_movies/modules/get_movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movies/modules/get_movies/domain/repositories/movie_repository_usecases.dart';

class MovieRepository implements MovieRepositoryUsecases {
  @override
  Future<Either<FailureMovie, Movie>> getMovieById(int id) {
    // TODO: implement getMovieById
    throw UnimplementedError();
  }

  @override
  Future<Either<FailureMovie, List<Movie>>> getSimilarMovies(int id) {
    // TODO: implement getSimilarMovies
    throw UnimplementedError();
  }
}
