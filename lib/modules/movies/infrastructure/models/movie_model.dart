import 'dart:convert';

import 'package:flutter_movies/modules/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  final String originalTitle;
  final int voteCount;
  final double popularity;
  final String posterPath;

  MovieModel({
    required this.originalTitle,
    required this.voteCount,
    required this.popularity,
    required this.posterPath,
  }) : super(originalTitle: originalTitle, voteCount: voteCount, popularity: popularity, posterPath: posterPath);


  Map<String, dynamic> toMap() {
    return {
      'original_title': originalTitle,
      'vote_count': voteCount,
      'popularity': popularity,
      'poster_path': posterPath,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      originalTitle: map['original_title'],
      voteCount: map['vote_count'],
      popularity: map['popularity'],
      posterPath: map['poster_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source));
}
