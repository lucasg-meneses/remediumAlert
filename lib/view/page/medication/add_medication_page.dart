import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remedium_alert/l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:remedium_alert/view/component/date_picker_field.dart';

class AddMedicationPage extends StatefulWidget {
  const AddMedicationPage({super.key});

  @override
  State<AddMedicationPage> createState() => _AddMedicationPageState();
}

class _AddMedicationPageState extends State<AddMedicationPage> {
  final medicationDurationStartController = TextEditingController();
  final medicationDurationEndController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.addMedication)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.medication),
                border: OutlineInputBorder(),
                labelText: l10n.medicationName,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.scale),
                      labelText: l10n.medicationDosage,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: l10n.medicationDosageUnit,
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'tablet',
                        child: Text(l10n.dosageUnitTablet),
                      ),
                      DropdownMenuItem(
                        value: 'capsule',
                        child: Text(l10n.dosageUnitCapsule),
                      ),
                      DropdownMenuItem(
                        value: 'ml',
                        child: Text(l10n.dosageUnitMl),
                      ),
                      DropdownMenuItem(
                        value: 'drop',
                        child: Text(l10n.dosageUnitDrop),
                      ),
                      DropdownMenuItem(
                        value: 'spray',
                        child: Text(l10n.dosageUnitSpray),
                      ),
                      DropdownMenuItem(
                        value: 'sachet',
                        child: Text(l10n.dosageUnitSachet),
                      ),
                      DropdownMenuItem(
                        value: 'injection',
                        child: Text(l10n.dosageUnitInjection),
                      ),
                    ],
                    onChanged: (value) {
                      // Handle dosage unit selection
                    },
                  ),
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.schedule),
                suffixText: l10n.medicationIntervalSuffix,
                labelText: l10n.medicationInterval,
              ),
            ),
            DatePickerField(
              titulo: l10n.medicationDurationStart,
              controller: medicationDurationStartController,
            ),

            DatePickerField(
              titulo: l10n.medicationDurationEnd,
              controller: medicationDurationEndController,
            ),

            Spacer(),
            FilledButton.icon(
              onPressed: () {},
              label: Text(l10n.save),
              icon: const Icon(Icons.save),
              iconAlignment: IconAlignment.start,
            ),
          ],
        ),
      ),
    );
  }
}
