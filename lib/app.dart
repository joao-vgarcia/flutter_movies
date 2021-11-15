import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/modules/movies/presenter/movie_details.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp        
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieDetailsPage(),  
    );
  }
}
