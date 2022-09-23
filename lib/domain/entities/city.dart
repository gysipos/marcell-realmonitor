import 'package:meta/meta.dart';
import 'package:realmonitor/domain/entities/county.dart';

@immutable
abstract class City {
  abstract final int id;
  abstract final String name;
  abstract final County county;
}
