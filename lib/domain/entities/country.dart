import 'package:meta/meta.dart';

@immutable
abstract class Country {
  abstract final int id;
  abstract final String iso;
  abstract final String name;
}
