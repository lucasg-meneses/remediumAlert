class MedicationModel {
  final int? id;
  final String name;
  int medicationDosage;
  String medicationDosageUnit;
  int medicationInterval;
  DateTime? endAt;
  DateTime startAt;


  MedicationModel({
    this.id,
    required this.name,
    required this.medicationDosage,
    required this.medicationDosageUnit,
    required this.medicationInterval,
    required this.startAt,
    this.endAt,
  });
  factory MedicationModel.fromMap(Map<String, dynamic> map) {
    return MedicationModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      medicationDosage: map['medication_dosage'] as int,
      medicationDosageUnit: map['medication_dosage_unit'] as String,
      medicationInterval: map['medication_interval'] as int,
      startAt: DateTime.parse(map['start_at'] as String),
      endAt: map['end_at'] != null
          ? DateTime.parse(map['end_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'medication_dosage': medicationDosage,
      'medication_dosage_unit': medicationDosageUnit,
      'medication_interval': medicationInterval,
      'start_at': startAt.toIso8601String(),
      'end_at': endAt?.toIso8601String(),
    };
  }
}
