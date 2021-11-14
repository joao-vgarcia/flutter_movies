import 'package:flutter_movies/modules/movies/domain/entities/similar_movies.dart';
import 'package:flutter_movies/modules/movies/domain/errors/errors.dart';
import 'package:flutter_movies/modules/movies/infrastructure/datasources/movie_datasource.dart';
import 'package:flutter_movies/modules/movies/infrastructure/models/movie_model.dart';
import 'package:flutter_movies/modules/movies/infrastructure/models/similar_movie_model.dart';
import 'package:flutter_movies/modules/movies/infrastructure/repositories/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieDatasource extends Mock implements MovieDatasource {}

void main() {
  MockMovieDatasource datasource = MockMovieDatasource();
  MovieRepository repository = MovieRepository(datasource);
  test('should get movie', () async {
    when(() => datasource.getMovieById(1)).thenAnswer((_) async => MovieModel(
        originalTitle: 'originalTitle',
        voteCount: 1,
        popularity: 1,
        posterPath: 'posterPath'));

    final result = await repository.getMovieById(1);

    expect(result.isRight(), true);
  });

  test('should similar movies', () async {
    when(() => datasource.getSimilarMovies(1)).thenAnswer(
        (_) async => [SimilarMovieModel('title', 'path', '2000')]);

    final result = await repository.getSimilarMovies(1);

    expect(result.isRight(), true);
  });

  test('should get invalid id error', () async {
    when(() => datasource.getMovieById(1)).thenThrow(Exception());
    when(() => datasource.getSimilarMovies(1)).thenThrow(Exception());

    final movie = await repository.getMovieById(1);
    final similarMovies = await repository.getSimilarMovies(1);

    expect(movie.isLeft(), true);
    expect(similarMovies.isLeft(), true);
  });
}
