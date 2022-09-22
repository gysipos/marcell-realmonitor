import 'package:realmonitor/data/datasources/local/database/local_database.dart';
import 'package:realmonitor/domain/entities/country.dart';

class CountryModel implements Country {
  @override
  final int id;
  @override
  final String iso;
  @override
  final String name;

  factory CountryModel.fromData(CountryData data) =>
      CountryModel(data.id, data.iso, data.name);

  const CountryModel(this.id, this.iso, this.name);
}
