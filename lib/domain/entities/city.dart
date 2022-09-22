import 'package:meta/meta.dart';
import 'package:realmonitor/domain/entities/country.dart';

@immutable
abstract class City {
  abstract final int id;
  abstract final String name;
  abstract final Country country;
}
