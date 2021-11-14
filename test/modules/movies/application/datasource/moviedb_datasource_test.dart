import 'package:dio/dio.dart';
import 'package:flutter_movies/modules/movies/application/datasource/moviedb_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// class MockDio extends Mock implements Dio {}

void main() {
  // MockDio dio = MockDio();
  Dio dio = Dio();
  MovieDbDatasource source = MovieDbDatasource(dio);
  test('Should get movie', () async {
    final response = await source.getMovieById(550);
  });
  
  test('Should get similar movies', () async {
    final response = await source.getSimilarMovies(550);
    // print(response.originalTitle);
  });
}
