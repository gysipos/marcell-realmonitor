import 'package:realmonitor/data/datasources/local/database/local_database.dart';
import 'package:realmonitor/domain/entities/city.dart';
import 'package:realmonitor/domain/entities/county.dart';

class CityModel implements City {
  @override
  final int id;
  @override
  final String name;
  @override
  final County county;

  factory CityModel.fromData(CityData data, County county) =>
      CityModel(data.id, data.name, county);

  CityModel(this.id, this.name, this.county);
}
