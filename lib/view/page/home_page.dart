import 'package:flutter/material.dart';
import 'package:remedium_alert/l10n/app_localizations.dart';
import 'package:remedium_alert/model/database_helper.dart' show DatabaseHelper;

import 'package:remedium_alert/view/page/medication/add_medication_page.dart'
    show AddMedicationPage;

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});

  final String title;
  final DatabaseHelper db = DatabaseHelper();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search)), IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))],
      ),
      body: StreamBuilder(
        stream: widget.db.getAllMedications(),
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
                  subtitle: Text(it.medicationDosageUnit),
                  onTap: () {},
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => AddMedicationPage(db: widget.db),
            ),
          );
        },
        tooltip: l10n.addMedication,
        child: const Icon(Icons.add),
      ),
    );
  }
}
