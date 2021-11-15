import 'package:flutter_movies/modules/movies/domain/entities/similar_movies.dart';
import 'package:flutter_movies/modules/movies/domain/errors/errors.dart';
import 'package:flutter_movies/modules/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movies/modules/movies/domain/repositories/movie_repository_usecases.dart';
import 'package:flutter_movies/modules/movies/domain/usecases/get_movie_usecase.dart';

class GetMovie implements GetMovieUsecase {
  final MovieRepositoryUsecases _repository;

  GetMovie(this._repository);

  @override
  Future<Either<FailureMovie, Movie>> getMovieById(int id) async {
    // final response = await _repository.getMovieById(id);
    // if (response.isRight()) {
    //   return response.toOption().toNullable()!;
    // }
    return await _repository.getMovieById(id);
  }

  @override
  Future<Either<FailureMovie, List<SimilarMovie>>> getSimilarMovies(
      int id) async {
    return await _repository.getSimilarMovies(id);
  }
}
