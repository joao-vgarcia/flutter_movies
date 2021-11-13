import 'dart:convert';

import 'package:flutter_movies/modules/get_movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  final String originalTitle;
  final int voteCount;
  final int popularity;
  final String posterPath;

  MovieModel({
    required this.originalTitle,
    required this.voteCount,
    required this.popularity,
    required this.posterPath,
  }) : super(originalTitle: originalTitle, voteCount: voteCount, popularity: popularity, posterPath: posterPath);


  Map<String, dynamic> toMap() {
    return {
      'originalTitle': originalTitle,
      'voteCount': voteCount,
      'popularity': popularity,
      'posterPath': posterPath,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      originalTitle: map['originalTitle'],
      voteCount: map['voteCount'],
      popularity: map['popularity'],
      posterPath: map['posterPath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source));
}
