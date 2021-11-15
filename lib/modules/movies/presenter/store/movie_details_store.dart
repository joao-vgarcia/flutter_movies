import 'dart:math';

import 'package:flutter_movies/modules/movies/domain/entities/movie.dart';
import 'package:flutter_movies/modules/movies/domain/entities/similar_movies.dart';
import 'package:flutter_movies/modules/movies/domain/usecases/get_movie.dart';
import 'package:mobx/mobx.dart';

part 'movie_details_store.g.dart';

class MovieDetailsStore = MovieDetailsStoreBase with _$MovieDetailsStore;

abstract class MovieDetailsStoreBase with Store {
  final GetMovie _getMovie;
  MovieDetailsStoreBase(this._getMovie);

  @computed
  int get movieId => _movieId;

  @observable
  int _movieId = Random().nextInt(901) + 200;

  @computed
  Movie get movie => _movie;

  @observable
  Movie _movie =
      Movie(originalTitle: '', popularity: 0, voteCount: 0, posterPath: '');

  @computed
  List<SimilarMovie> get similarMovie => _similarMovie;

  @observable
  List<SimilarMovie> _similarMovie = [];

  @computed
  String get basePath => 'https://image.tmdb.org/t/p/original';

  @action
  setNewRandomValue() => _movieId = Random().nextInt(901) + 200;

  @action
  Future<void> getMovieById() async {
    var value = await _getMovie.getMovieById(movieId);
    await getSimilarMovies();
    final movieValue = value.toOption().toNullable();

    Future.delayed(const Duration(seconds: 2), () {
      if (movie.posterPath == '') {
        setNewRandomValue();
        getMovieById();
      }
    });

    _movie = Movie(
      originalTitle: movieValue?.originalTitle ?? '',
      popularity: movieValue?.popularity ?? 0,
      voteCount: movieValue?.voteCount ?? 0,
      posterPath: movieValue?.posterPath ?? '',
    );
  }

  @action
  Future<void> getSimilarMovies() async {
    final value = await _getMovie.getSimilarMovies(movieId);
    final movieList = value.toOption().toNullable();
    if (_similarMovie.isNotEmpty) {
      _similarMovie.clear();
    }
    _similarMovie.addAll(movieList!);
  }

  String posterPath(String path) {
    return '$basePath$path';
  }

  String parseLikes(double likes) {
    return '$likes likes';
  }
}
