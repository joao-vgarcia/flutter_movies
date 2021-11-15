import 'dart:convert';

import 'package:movies/modules/movies/domain/entities/similar_movies.dart';

class SimilarMovieModel extends SimilarMovie {
  final String title;
  final String posterPath;
  final String releaseDate;

  SimilarMovieModel(this.title, this.posterPath, this.releaseDate) : super(title: title, posterPath: posterPath, releaseDate: releaseDate);
  

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': posterPath,
      'release_date': releaseDate,
    };
  }

  factory SimilarMovieModel.fromMap(Map<String, dynamic> map) {
    return SimilarMovieModel(
      map['title'],
      map['poster_path'],
      map['release_date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SimilarMovieModel.fromJson(String source) => SimilarMovieModel.fromMap(json.decode(source));
}
