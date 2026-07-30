import 'package:flutter/widgets.dart';
import 'package:remedium_alert/l10n/app_localizations.dart';

enum DosageUnit {
  tablet,
  capsule,
  ml,
  drop,
  spray,
  sachet,
  injection;
}

extension DosageUnitL10n on DosageUnit {
  String localizedName(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case DosageUnit.tablet:
        return l10n.dosageUnitTablet;
      case DosageUnit.capsule:
        return l10n.dosageUnitCapsule;
      case DosageUnit.ml:
        return l10n.dosageUnitMl;
      case DosageUnit.drop:
        return l10n.dosageUnitDrop;
      case DosageUnit.spray:
        return l10n.dosageUnitSpray;
      case DosageUnit.sachet:
        return l10n.dosageUnitSachet;
      case DosageUnit.injection:
        return l10n.dosageUnitInjection;
    }
  }
}