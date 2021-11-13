import 'package:dartz/dartz.dart';
import 'package:flutter_movies/modules/get_movies/domain/entities/movie.dart';
import 'package:flutter_movies/modules/get_movies/domain/repositories/movie_repository_usecases.dart';
import 'package:flutter_movies/modules/get_movies/domain/usecases/get_movie.dart';
import 'package:flutter_test/flutter_test.dart';

// used mocktail istead of mockito to use either values on flutter 2.0 v
import 'package:mocktail/mocktail.dart';

class MockMovieRepository extends Mock implements MovieRepositoryUsecases {}

void main() {
  GetMovie getMovie;
  MockMovieRepository repository;
  repository = MockMovieRepository();
  getMovie = GetMovie(repository);

  final mockedMovie = Movie(originalTitle: 'a', popularity: 1, voteCount: 1, posterPath: '/');

  test('should get movie', () async {
    when(() => repository.getMovieById(1)).thenAnswer((_) async => Right(mockedMovie));
    final movie = await getMovie.getMovieById(1);
    expect(movie.isRight(), true);
  });

  test('should get similar movies', () async {
    when(() => repository.getSimilarMovies(1)).thenAnswer((_) async => Right([mockedMovie]));
    final similarMovies = await getMovie.getSimilarMovies(1);
    expect(similarMovies.isRight(), true);
  });

}
