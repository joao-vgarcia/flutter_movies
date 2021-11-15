// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_movies/core/service_locator.dart';
import 'package:flutter_movies/modules/movies/presenter/store/movie_details_store.dart';

class MovieDetailsPage extends StatefulWidget {
  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final store = getIt<MovieDetailsStore>();
  bool liked = false;

  @override
  void initState() {
    super.initState();
    store.getMovieById();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Observer(
      builder: (_) => store.movie.posterPath != ''
          ? Container(
              color: Colors.black,
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Observer(
                    builder: (_) => Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 350,
                          child: Image.network(
                            store.posterPath(store.movie.posterPath),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Opacity(
                          opacity: 1,
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: const [
                                  Color(0xFF000000),
                                  Colors.transparent,
                                ],
                                begin: const FractionalOffset(1.0, 1.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: const [0.0, 1.0],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Observer(
                        builder: (_) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width / 1.4,
                              height: 70,
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                store.movie.originalTitle,
                                style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              width: 80,
                              padding: const EdgeInsets.only(top: 10),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    liked = !liked;
                                  });
                                },
                                child: liked
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 15),
                          const Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            store.parseLikes(store.movie.popularity),
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.visibility,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${store.movie.voteCount.toString()} views',
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Observer(
                    builder: (_) => Expanded(
                      child: ListView.builder(
                        itemCount: store.similarMovie.length,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: const EdgeInsets.only(top: 15, left: 10),
                            width: width,
                            child: Row(
                              children: [
                                Image.network(
                                  store.posterPath(
                                      store.similarMovie[i].posterPath),
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: width / 1.4,
                                        child: Text(
                                          store.similarMovie[i].title,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              decoration: TextDecoration.none,
                                              fontSize: 18),
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                      Text(
                                        store.similarMovie[i].releaseDate
                                            .substring(0, 4),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.none,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container(
              height: height,
              alignment: Alignment.center,
              color: Colors.blueGrey,
              child: const Text(
                'Carregando',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
    );
  }
}
