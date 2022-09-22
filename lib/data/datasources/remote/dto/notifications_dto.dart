class NotificationDto {
  bool? isNotificationEnabled;
  bool? privateAdvertisersOnly;
  bool? filterOutSuspiciousItems;
  bool? onlyPolisWithPictures;
  String? nameSpace;
  List<_Locations> locations;
  String? name;
  String? assignmentType;
  List<String>? estateTypes;
  int? createTime;
  bool? usesUmbrella;
  int id;
  int? minPrice;
  int? maxPrice;
  int? minFloorArea;
  int? maxFloorArea;
  int? minUnitPrice;
  int? maxUnitPrice;

  NotificationDto({
    this.isNotificationEnabled,
    this.privateAdvertisersOnly,
    this.filterOutSuspiciousItems,
    this.onlyPolisWithPictures,
    this.nameSpace,
    required this.locations,
    this.name,
    this.assignmentType,
    this.estateTypes,
    this.createTime,
    this.usesUmbrella,
    required this.id,
    this.minPrice,
    this.maxPrice,
    this.minFloorArea,
    this.maxFloorArea,
    this.minUnitPrice,
    this.maxUnitPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isNotificationEnabled': isNotificationEnabled,
      'privateAdvertisersOnly': privateAdvertisersOnly,
      'filterOutSuspiciousItems': filterOutSuspiciousItems,
      'onlyPolisWithPictures': onlyPolisWithPictures,
      'nameSpace': nameSpace,
      'locations': locations,
      'name': name,
      'assignmentType': assignmentType,
      'estateTypes': estateTypes,
      'createTime': createTime,
      'usesUmbrella': usesUmbrella,
      'id': id,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'minFloorArea': minFloorArea,
      'maxFloorArea': maxFloorArea,
      'minUnitPrice': minUnitPrice,
      'maxUnitPrice': maxUnitPrice,
    };
  }

  factory NotificationDto.fromMap(Map<String, dynamic> map) {
    return NotificationDto(
      isNotificationEnabled: map['isNotificationEnabled'] as bool,
      privateAdvertisersOnly: map['privateAdvertisersOnly'] as bool,
      filterOutSuspiciousItems: map['filterOutSuspiciousItems'] as bool,
      onlyPolisWithPictures: map['onlyPolisWithPictures'] as bool,
      nameSpace: map['nameSpace'] as String,
      locations: (map['locations'] as List<dynamic>)
          .map((dynamic e) => _Locations.fromMap(e as Map<String, dynamic>))
          .toList(),
      name: map['name'] as String,
      assignmentType: map['assignmentType'] as String,
      estateTypes: (map['estateTypes'] as List<dynamic>).cast<String>(),
      createTime: map['createTime'] as int,
      usesUmbrella: map['usesUmbrella'] as bool,
      id: map['id'] as int,
      minPrice: map['minPrice'] as int?,
      maxPrice: map['maxPrice'] as int?,
      minFloorArea: map['minFloorArea'] as int?,
      maxFloorArea: map['maxFloorArea'] as int?,
      minUnitPrice: map['minUnitPrice'] as int?,
      maxUnitPrice: map['maxUnitPrice'] as int?,
    );
  }
}

class _Locations {
  _Locations({
    this.accessTokens,
    this.adminLevels,
    this.nameSpace,
    this.ids,
  });

  List<String>? accessTokens;
  Map<String, String>? adminLevels;
  String? nameSpace;
  List<String>? ids;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessTokens': accessTokens,
      'adminLevels': adminLevels,
      'nameSpace': nameSpace,
      'ids': ids,
    };
  }

  factory _Locations.fromMap(Map<String, dynamic> map) {
    return _Locations(
      accessTokens: (map['accessTokens'] as List<dynamic>).cast<String>(),
      adminLevels: (map['adminLevels'] as Map<String, dynamic>)
          .map((key, dynamic value) => MapEntry(key, value as String)),
      nameSpace: map['nameSpace'] as String,
      ids: (map['ids'] as List<dynamic>).cast<String>(),
    );
  }
}
