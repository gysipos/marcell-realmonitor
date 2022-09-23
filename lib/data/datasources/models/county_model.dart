import 'package:realmonitor/data/datasources/local/database/local_database.dart';
import 'package:realmonitor/domain/entities/county.dart';

class CountyModel implements County {
  @override
  final int id;
  @override
  final String name;

  factory CountyModel.fromData(CountyData data) =>
      CountyModel(data.id, data.name);

  const CountyModel(this.id, this.name);
}
