import 'package:flutter_movies/modules/get_movies/domain/errors/errors.dart';
import 'package:flutter_movies/modules/get_movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movies/modules/get_movies/domain/repositories/movie_repository_usecases.dart';
import 'package:flutter_movies/modules/get_movies/domain/usecases/get_movie_usecase.dart';

class GetMovie implements GetMovieUsecase {
  final MovieRepositoryUsecases _repository;

  GetMovie(this._repository);

  @override
  Future<Either<FailureMovie, Movie>> getMovieById(int id) async {
    return await _repository.getMovieById(id);
  }

  @override
  Future<Either<FailureMovie, List<Movie>>> getSimilarMovies(int id) async {
    return await _repository.getSimilarMovies(id);
  }
}
