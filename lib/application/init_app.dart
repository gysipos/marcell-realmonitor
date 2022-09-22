import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'hu';
  await initializeDateFormatting('hu');
  await _precacheImages();
}

Future<void> _precacheImages() async {
  final manifestContent = await rootBundle.loadString('AssetManifest.json');
  final manifestMap = json.decode(manifestContent) as Map<String, dynamic>;

  final imagePaths = manifestMap.keys
      .where((String key) => key.startsWith('images/') && key.endsWith('.svg'));

  for (var image in imagePaths) {
    await precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, image), null);
  }
}
