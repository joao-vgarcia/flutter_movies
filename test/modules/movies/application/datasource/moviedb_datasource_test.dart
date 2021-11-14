import 'package:dio/dio.dart';
import 'package:flutter_movies/modules/movies/application/datasource/moviedb_datasource.dart';
import 'package:flutter_movies/modules/movies/infrastructure/models/list_of_similar_movies_model.dart';
import 'package:flutter_movies/modules/movies/infrastructure/models/movie_model.dart';
import 'package:flutter_movies/modules/movies/infrastructure/models/similar_movie_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  MockDio dio = MockDio();
  MovieDbDatasource source = MovieDbDatasource(dio);
  String path =
      'https://api.themoviedb.org/3/movie/550?api_key=f762b12aa5ec3b09e39664a9a0915134';
  String pathSimilar =
      'https://api.themoviedb.org/3/movie/550/similar?api_key=f762b12aa5ec3b09e39664a9a0915134';

  MovieModel mockedModel = MovieModel(
    originalTitle: 'originalTitle',
    voteCount: 1,
    popularity: 1,
    posterPath: 'posterPath',
  );
  List<SimilarMovieModel> similarModel = [
    SimilarMovieModel('title', 'posterPath', '2000-01-01')
  ];

  ListOfSimilarMovies mockedList = ListOfSimilarMovies(similarModel);

  test('Should get movie', () async {
    when(() => dio.get(path)).thenAnswer((_) async => Response(
        data: mockedModel.toMap(),
        statusCode: 200,
        requestOptions: RequestOptions(path: path)));
    final response = await source.getMovieById(550);

    expect(response.originalTitle, 'originalTitle');
  });

  test('Should get similar movies', () async {
    when(() => dio.get(pathSimilar)).thenAnswer((_) async => Response(
        data: mockedList.toMap(),
        statusCode: 200,
        requestOptions: RequestOptions(path: pathSimilar)));
    final response = await source.getSimilarMovies(550);
    expect(response[0].title, 'title');
  });
}
