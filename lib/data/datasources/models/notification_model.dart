import 'package:realmonitor/data/datasources/local/database/local_database.dart';
import 'package:realmonitor/data/datasources/models/city_model.dart';
import 'package:realmonitor/data/datasources/models/country_model.dart';
import 'package:realmonitor/data/datasources/remote/dto/notifications_dto.dart';
import 'package:realmonitor/domain/entities/assignment_type.dart';
import 'package:realmonitor/domain/entities/city.dart';
import 'package:realmonitor/domain/entities/estate_type.dart';
import 'package:realmonitor/domain/entities/notification.dart';
import 'package:realmonitor/utils/immutable_list.dart';
import 'package:recase/recase.dart';

class NotificationModel implements Notification {
  @override
  final int id;
  @override
  final String name;
  @override
  final AssignmentType assignmentType;
  @override
  final City city;
  @override
  final ImmutableList<EstateType> estateTypes;
  @override
  final int? minFloorArea;
  @override
  final int? maxFloorArea;
  @override
  final int? minPrice;
  @override
  final int? maxPrice;
  @override
  final bool isEnabled;

  factory NotificationModel.fromData(NotificationData data, City city,
          ImmutableList<EstateType> estateTypes) =>
      NotificationModel(
        data.id,
        data.name,
        data.assignmentType,
        city,
        estateTypes,
        data.minFloorArea,
        data.maxFloorArea,
        data.minPrice,
        data.maxPrice,
        data.isEnabled,
      );

  factory NotificationModel.fromDto(NotificationDto dto) {
    final country =
        CountryModel(0, '', dto.locations.first.adminLevels!.values.first);
    final city = CityModel(
        0, dto.locations.first.adminLevels!.values.elementAt(1), country);
    return NotificationModel(
      dto.id,
      dto.name!,
      AssignmentType.values.byName(dto.assignmentType!.camelCase),
      city,
      ImmutableList(
          dto.estateTypes!.map((e) => EstateType.values.byName(e.camelCase))),
      dto.minFloorArea,
      dto.maxFloorArea,
      dto.minPrice,
      dto.maxPrice,
      dto.isNotificationEnabled ?? false,
    );
  }

  const NotificationModel(
    this.id,
    this.name,
    this.assignmentType,
    this.city,
    this.estateTypes,
    this.minFloorArea,
    this.maxFloorArea,
    this.minPrice,
    this.maxPrice,
    this.isEnabled,
  );

  NotificationModel copyWith({required bool isEnabled}) {
    return NotificationModel(id, name, assignmentType, city, estateTypes,
        minFloorArea, maxFloorArea, minPrice, maxPrice, isEnabled);
  }
}
