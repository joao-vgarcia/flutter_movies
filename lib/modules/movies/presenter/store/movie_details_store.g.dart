// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailsStore on MovieDetailsStoreBase, Store {
  Computed<int>? _$movieIdComputed;

  @override
  int get movieId => (_$movieIdComputed ??= Computed<int>(() => super.movieId,
          name: 'MovieDetailsStoreBase.movieId'))
      .value;
  Computed<Movie>? _$movieComputed;

  @override
  Movie get movie => (_$movieComputed ??= Computed<Movie>(() => super.movie,
          name: 'MovieDetailsStoreBase.movie'))
      .value;

  final _$_movieAtom = Atom(name: 'MovieDetailsStoreBase._movie');

  @override
  Movie get _movie {
    _$_movieAtom.reportRead();
    return super._movie;
  }

  @override
  set _movie(Movie value) {
    _$_movieAtom.reportWrite(value, super._movie, () {
      super._movie = value;
    });
  }

  @override
  String toString() {
    return '''
movieId: ${movieId},
movie: ${movie}
    ''';
  }
}
