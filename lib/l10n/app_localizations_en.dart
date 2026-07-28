// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get addMedication => 'Add Medication';

  @override
  String get editMedication => 'Edit Medication';

  @override
  String get medicationDetails => 'Medication Details';

  @override
  String get medicationName => 'Medication Name';

  @override
  String get medicationDosage => 'Dosage';

  @override
  String get medicationInterval => 'Dosing Interval';

  @override
  String get save => 'Save';

  @override
  String get medicationIntervalSuffix => 'Hour(s)';

  @override
  String get medicationDosageUnit => 'Dose Unit';

  @override
  String get dosageUnitTablet => 'Tablet';

  @override
  String get dosageUnitCapsule => 'Capsule';

  @override
  String get dosageUnitMl => 'mL';

  @override
  String get dosageUnitDrop => 'Drop';

  @override
  String get dosageUnitSpray => 'Spray';

  @override
  String get dosageUnitSachet => 'Sachet';

  @override
  String get dosageUnitInjection => 'Injection';

  @override
  String get medicationDurationEnd => 'Treatment End Date';

  @override
  String get medicationDurationStart => 'Treatment Start Date';

  @override
  String get today => 'Today';

  @override
  String get now => 'Now';
}
