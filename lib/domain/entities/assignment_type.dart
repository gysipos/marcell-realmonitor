enum AssignmentType { forSale, forRent }

extension AssignmentTypeName on AssignmentType {
  String get title => _translations[this]!;
}

final _translations = <AssignmentType, String>{
  AssignmentType.forSale: 'Eladó',
  AssignmentType.forRent: 'Kiadó'
};
