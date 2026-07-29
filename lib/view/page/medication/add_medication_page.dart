import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remedium_alert/core/dosage_unit.dart';
import 'package:remedium_alert/l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:remedium_alert/model/entity/medication_model.dart'
    show MedicationModel;
import 'package:remedium_alert/model/repository/medication_repository.dart';
import 'package:remedium_alert/view/component/date_picker_field.dart';

class AddMedicationPage extends StatefulWidget {
  const AddMedicationPage({super.key, required this.medicationRepository});
  final MedicationRepository medicationRepository;

  @override
  State<AddMedicationPage> createState() => _AddMedicationPageState();
}

class _AddMedicationPageState extends State<AddMedicationPage> {
  final medicationDurationStartController = TextEditingController();
  final medicationDurationEndController = TextEditingController();
  final medicationDosageController = TextEditingController();
  final medicationNameController = TextEditingController();
  final medicationIntervalController = TextEditingController();
  final medicationDosageUnitController = TextEditingController();

  DateTime? medicationDurationEnd;
  DateTime medicationDurationStart = DateTime.now();

  late bool isContinuousUse = false;

  void _showSnackBar(String info) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(info),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Code to execute.
          },
        ),
      ),
    );
  }

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
              controller: medicationNameController,
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
                    controller: medicationDosageController,
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
                  child: DropdownButtonFormField<DosageUnit>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: l10n.medicationDosageUnit,
                    ),
                    items: DosageUnit.values
                        .map(
                          (unit) => DropdownMenuItem<DosageUnit>(
                            value: unit,
                            child: Text(unit.localizedName(context)),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) {
                          medicationDosageUnitController.text = value.name;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: medicationIntervalController,
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
              onDateSelected: (value) => medicationDurationStart = value,
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.continuousUse),
              value: isContinuousUse,
              onChanged: (value) {
                setState(() {
                  isContinuousUse = value;
                });
              },
            ),
            if (!isContinuousUse)
              DatePickerField(
                titulo: l10n.medicationDurationEnd,
                controller: medicationDurationEndController,
                onDateSelected: (value) => medicationDurationEnd = value,
              ),

            Spacer(),
            FilledButton.icon(
              label: Text(l10n.save),
              icon: const Icon(Icons.save),
              iconAlignment: IconAlignment.start,
              onPressed: () async {
                var name = medicationNameController.text;
                var medicationDosage = medicationDosageController.text;
                var medicationDosageUnit = medicationDosageUnitController.text;
                var medicationInterval = medicationIntervalController.text;
                var startAt = medicationDurationStart;
                if (name.isEmpty) {
                  _showSnackBar(l10n.requiredFieldEmpty(l10n.medicationName));
                }

                if (medicationDosage.isEmpty) {
                  _showSnackBar(l10n.requiredFieldEmpty(l10n.medicationDosage));
                }
                if (medicationDosageUnit.isEmpty) {
                  _showSnackBar(
                    l10n.requiredFieldEmpty(l10n.medicationDosageUnit),
                  );
                }
                if (medicationInterval.isEmpty) {
                  _showSnackBar(
                    l10n.requiredFieldEmpty(l10n.medicationInterval),
                  );
                }
                if (startAt.toString().isEmpty) {
                  _showSnackBar(
                    l10n.requiredFieldEmpty(l10n.medicationDurationStart),
                  );
                }

                if (name.isNotEmpty &&
                    medicationInterval.isNotEmpty &&
                    medicationDosageUnit.isNotEmpty &&
                    medicationDosage.isNotEmpty) {
                  var medic = MedicationModel(
                    name: name,
                    medicationDosage: int.parse(medicationDosage),
                    medicationDosageUnit: medicationDosageUnit,
                    medicationInterval: int.parse(medicationInterval),
                    startAt: startAt,
                    endAt: medicationDurationEnd,
                  );
                  try {
                    widget.medicationRepository.inserir(medic);
                  } catch (e) {
                    _showSnackBar(l10n.mensageSaveError);
                  }

                  if (context.mounted) {
                    _showSnackBar(l10n.mensageSavedSuccessfully);
                    Navigator.pop(context);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
