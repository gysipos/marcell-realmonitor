import 'package:meta/meta.dart';
import 'package:realmonitor/domain/entities/assignment_type.dart';
import 'package:realmonitor/domain/entities/city.dart';
import 'package:realmonitor/domain/entities/estate_type.dart';

@immutable
abstract class Notification {
  abstract final int id;
  abstract final String name;
  abstract final AssignmentType assignmentType;
  abstract final List<EstateType> estateTypes;
  abstract final City city;
  abstract final int? minFloorArea;
  abstract final int? maxFloorArea;
  abstract final int? minPrice;
  abstract final int? maxPrice;
  abstract final bool isEnabled;
}
