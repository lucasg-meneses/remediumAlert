import 'package:flutter/material.dart';
import 'package:remedium_alert/l10n/app_localizations.dart';
import 'package:remedium_alert/view/page/medication/add_medication_page.dart' show AddMedicationPage;

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: const Center(child: Text('Welcome to the Home Page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => AddMedicationPage(),
            ),
          );
        },
        tooltip: l10n.addMedication,
        child: const Icon(Icons.add),
      ),
    );
  }
}
