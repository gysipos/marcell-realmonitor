enum EstateType { house, flat, room, office }

extension EstateTypeName on EstateType {
  String get title => _translations[this]!;
}

final _translations = <EstateType, String>{
  EstateType.house: 'ház',
  EstateType.flat: 'lakás',
  EstateType.room: 'szoba',
  EstateType.office: 'iroda',
};
