import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:road_to_the_dream/app/app.dart';
import 'package:road_to_the_dream/main.config.dart';

@injectableInit
void configureDepencies() => $initGetIt(GetIt.I);

void main() {
  configureDepencies();
  runApp(const App());
}
