import 'package:dio/dio.dart';
import 'package:movies/core/api_client.dart';
import 'package:movies/modules/movies/external/datasource/moviedb_datasource.dart';
import 'package:movies/modules/movies/infrastructure/models/list_of_similar_movies_model.dart';
import 'package:movies/modules/movies/infrastructure/models/movie_model.dart';
import 'package:movies/modules/movies/infrastructure/models/similar_movie_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  MockApiClient apiClient = MockApiClient();
  MovieDbDatasource source = MovieDbDatasource(apiClient);
 
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
    when(() => apiClient.get(any())).thenAnswer((_) async => Response(
        data: mockedModel.toMap(),
        statusCode: 200,
        requestOptions: RequestOptions(path: '')));

    final response = await source.getMovieById(550);

    expect(response.originalTitle, 'originalTitle');
  });

  test('Should get similar movies', () async {
    when(() => apiClient.get(any(), path: 'similar')).thenAnswer((_) async => Response(
        data: mockedList.toMap(),
        statusCode: 200,
        requestOptions: RequestOptions(path: '')));
    final response = await source.getSimilarMovies(550);
    expect(response[0].title, 'title');
  });
}
