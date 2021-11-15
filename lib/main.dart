import 'package:flutter/material.dart';
import 'package:movies/app.dart';
import 'package:movies/core/service_locator.dart' as getItInstance;

void main() {
  getItInstance.init();
  runApp(MyApp());
}
