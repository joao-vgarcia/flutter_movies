import 'package:flutter/material.dart';
import 'package:flutter_movies/app.dart';
import 'package:flutter_movies/core/service_locator.dart' as getItInstance;

void main() {
  getItInstance.init();
  runApp(MyApp());
}
