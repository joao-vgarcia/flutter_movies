import 'package:flutter_movies/core/api_client.dart';
import 'package:flutter_movies/modules/movies/domain/entities/similar_movies.dart';
import 'package:flutter_movies/modules/movies/infrastructure/datasources/movie_datasource.dart';
import 'package:flutter_movies/modules/movies/infrastructure/models/list_of_similar_movies_model.dart';
import 'package:flutter_movies/modules/movies/infrastructure/models/movie_model.dart';

class MovieDbDatasource implements MovieDatasource {
  ApiClient apiClient;

  MovieDbDatasource(this.apiClient);

  @override
  Future<MovieModel> getMovieById(int id) async {
    final response = await apiClient.get(id.toString());
    MovieModel model = MovieModel.fromMap(response.data);
    return model;
  }

  @override
  Future<List<SimilarMovie>> getSimilarMovies(int id) async {
    final response = await apiClient.get(id.toString(), path: 'similar');
    final listOfMovies = ListOfSimilarMovies.fromMap(response.data);
    
    List<SimilarMovie> results = [];
    for (var element in listOfMovies.results) {
      results.add(element);
    }
    return results;
  }
}
