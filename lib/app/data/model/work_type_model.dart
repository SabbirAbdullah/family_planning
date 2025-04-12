class WorkType {
  final int id;
  final String name;
  final int workTypeId;
  final String workType;

  WorkType({
    required this.id,
    required this.name,
    required this.workTypeId,
    required this.workType,
  });

  factory WorkType.fromJson(Map<String, dynamic> json) {
    return WorkType(
      id: json['id'],
      name: json['name'],
      workTypeId: json['work_type_id'],
      workType: json['work_type'],
    );
  }
}



class WorkField {
  final int fieldId;
  final int workTypeId;
  final String field;
  final String fieldType;
  final String dropdownMenu;

  WorkField({
    required this.fieldId,
    required this.workTypeId,
    required this.field,
    required this.fieldType,
    required this.dropdownMenu,
  });

  factory WorkField.fromJson(Map<String, dynamic> json) {
    return WorkField(
      fieldId: json['field_id'],
      workTypeId: json['work_type_id'],
      field: json['field'],
      fieldType: json['field_type'],
      dropdownMenu: json['DropdownMenu'] ?? '',
    );
  }
}
