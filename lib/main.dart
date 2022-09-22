import 'package:flutter/material.dart';
import 'package:realmonitor/application/datasources.dart';
import 'package:realmonitor/application/init_app.dart';
import 'package:realmonitor/application/realmonitor_app.dart';

Future<void> main() async {
  await initApp();
  runApp(MockDatasource(RealmonitorApp()));
}
