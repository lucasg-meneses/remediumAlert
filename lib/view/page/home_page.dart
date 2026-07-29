import 'package:flutter/material.dart';
import 'package:remedium_alert/core/dosage_unit.dart';
import 'package:remedium_alert/l10n/app_localizations.dart';
import 'package:remedium_alert/model/entity/medication_model.dart';
import 'package:remedium_alert/model/repository/medication_repository.dart';
import 'package:remedium_alert/view/page/medication/add_medication_page.dart'
    show AddMedicationPage;

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});

  final String title;
  final MedicationRepository medicationRepository = MedicationRepository();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<MedicationModel>> _medicationsFuture;
  @override
  void initState() {
    super.initState();
    _medicationsFuture = widget.medicationRepository.getAll();
  }

  void _reload() {
    setState(() {
      _medicationsFuture = widget.medicationRepository.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
            onPressed: () {
              _reload();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _medicationsFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final items = snapshot.data!;
          return ListView(
            children: items.map((it) {
              return Card(
                child: ListTile(
                  title: Text(it.name),
                  subtitle: Text(
                    "${it.medicationDosage} ${DosageUnit.values.byName(it.medicationDosageUnit).localizedName(context)}  ${it.medicationInterval} h",
                  ),
                  onTap: () {},
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => AddMedicationPage(
                medicationRepository: widget.medicationRepository,
              ),
            ),
          );
          _reload();
        },
        tooltip: l10n.addMedication,
        child: const Icon(Icons.add),
      ),
    );
  }
}
