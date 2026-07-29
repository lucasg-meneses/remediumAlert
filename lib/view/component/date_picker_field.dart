import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:intl/intl.dart';
import 'package:remedium_alert/l10n/app_localizations.dart';

class DatePickerField extends StatefulWidget {
  final String titulo;
  final TextEditingController controller;
  final ValueChanged<DateTime> onDateSelected;

  const DatePickerField({
    super.key,
    required this.titulo,
    required this.controller,
    required this.onDateSelected
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  late var l10n = AppLocalizations.of(context)!;

  void _selecionarData() {
    picker.DatePicker.showDateTimePicker(
      context,
      theme: picker.DatePickerTheme(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        itemStyle: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: 18,
        ),
        doneStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 16,
        ),
      ),
      showTitleActions: true,
      locale: l10n.localeName == 'pt'
          ? picker.LocaleType.pt
          : picker.LocaleType.en,
      minTime: DateTime.now(),
      onConfirm: (date) {
        widget.onDateSelected(date);
        final locale = Localizations.localeOf(context).toString();
        widget.controller.text = DateFormat.yMd(locale).add_Hm().format(date);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true,
      onTap: _selecionarData,
      decoration: InputDecoration(
        labelText: widget.titulo,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_month),
          onPressed: _selecionarData,
        ),
      ),
    );
  }
}
