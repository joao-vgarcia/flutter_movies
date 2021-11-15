import 'package:movies/modules/movies/domain/entities/similar_movies.dart';
import 'package:movies/modules/movies/domain/errors/errors.dart';
import 'package:movies/modules/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/modules/movies/domain/repositories/movie_repository_usecases.dart';
import 'package:movies/modules/movies/infrastructure/datasources/movie_datasource.dart';

class MovieRepository implements MovieRepositoryUsecases {
  MovieDatasource datasource;

  MovieRepository(this.datasource);

  @override
  Future<Either<FailureMovie, Movie>> getMovieById(int id) async {
    try {
      Movie movie = await datasource.getMovieById(id);
      return Right(movie);
    } catch (e) {
      return Left(InvalidIdError('ID'));
    }
  }

  @override
  Future<Either<FailureMovie, List<SimilarMovie>>> getSimilarMovies(int id) async {
    try {
      List<SimilarMovie> similarMovies = await datasource.getSimilarMovies(id);
      return Right(similarMovies);
    } catch (e) {
      return Left(InvalidIdError('ID'));
    }
  }
}
