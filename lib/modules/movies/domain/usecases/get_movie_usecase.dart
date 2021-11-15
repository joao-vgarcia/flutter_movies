import 'package:dartz/dartz.dart';
import 'package:movies/modules/movies/domain/entities/movie.dart';
import 'package:movies/modules/movies/domain/entities/similar_movies.dart';
import 'package:movies/modules/movies/domain/errors/errors.dart';

abstract class GetMovieUsecase {
  Future<Either<FailureMovie, Movie>> getMovieById(int id);
  Future<Either<FailureMovie, List<SimilarMovie>>> getSimilarMovies(int id);
}
