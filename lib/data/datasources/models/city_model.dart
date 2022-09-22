import 'package:realmonitor/data/datasources/local/database/local_database.dart';
import 'package:realmonitor/domain/entities/city.dart';
import 'package:realmonitor/domain/entities/country.dart';

class CityModel implements City {
  @override
  final int id;
  @override
  final String name;
  @override
  final Country country;

  factory CityModel.fromData(CityData data, Country country) =>
      CityModel(data.id, data.name, country);

  CityModel(this.id, this.name, this.country);
}
