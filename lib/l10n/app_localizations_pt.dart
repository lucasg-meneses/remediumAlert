// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get addMedication => 'Adicionar Medicação';

  @override
  String get editMedication => 'Editar Medicação';

  @override
  String get medicationDetails => 'Detalhes da Medicação';

  @override
  String get medicationName => 'Nome da Medicação';

  @override
  String get medicationDosage => 'Dosagem';

  @override
  String get medicationInterval => 'Intervalo entre Doses';

  @override
  String get save => 'Salvar';

  @override
  String get medicationIntervalSuffix => 'Hora(s)';

  @override
  String get medicationDosageUnit => 'Unidade da Dose';

  @override
  String get dosageUnitTablet => 'Comprimido';

  @override
  String get dosageUnitCapsule => 'Cápsula';

  @override
  String get dosageUnitMl => 'mL';

  @override
  String get dosageUnitDrop => 'Gota';

  @override
  String get dosageUnitSpray => 'Jato';

  @override
  String get dosageUnitSachet => 'Sachê';

  @override
  String get dosageUnitInjection => 'Injeção';

  @override
  String get medicationDurationEnd => 'Data de Término do Tratamento';

  @override
  String get medicationDurationStart => 'Data Inicial do Tratamento';

  @override
  String get today => 'Hoje';

  @override
  String get now => 'Agora';

  @override
  String get mensageSavedSuccessfully => 'Salvo com sucesso';

  @override
  String get mensageSaveError => 'Ocorreu um erro ao salvar. Tente novamente.';

  @override
  String get continuousUse => 'Uso contínuo';

  @override
  String requiredFieldEmpty(String field) {
    return 'O campo $field é obrigatório.';
  }
}
