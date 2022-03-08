import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_template_project/app/app.dart';
import 'package:flutter_template_project/main.config.dart';

@injectableInit
void configureDepencies() => $initGetIt(GetIt.I);

void main() {
  configureDepencies();
  runApp(const App());
}
