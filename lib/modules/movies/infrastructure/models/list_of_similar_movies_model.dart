import 'dart:convert';

import 'package:flutter_movies/modules/movies/infrastructure/models/similar_movie_model.dart';

class ListOfSimilarMovies {
  // final String page;
  final List<SimilarMovieModel> results;

  ListOfSimilarMovies( this.results);

  Map<String, dynamic> toMap() {
    return {
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory ListOfSimilarMovies.fromMap(Map<String, dynamic> map) {
    return ListOfSimilarMovies(
      List<SimilarMovieModel>.from(map['results']?.map((x) => SimilarMovieModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListOfSimilarMovies.fromJson(String source) => ListOfSimilarMovies.fromMap(json.decode(source));
}
