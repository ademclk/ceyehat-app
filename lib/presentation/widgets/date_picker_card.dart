import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerCard extends StatelessWidget {
  final String label;
  final DateTime date;
  final ValueChanged<DateTime> onDateChanged;

  const DatePickerCard({
    Key? key,
    required this.label,
    required this.date,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: InkWell(
        onTap: () => _selectDate(context, date),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).canvasColor)),
              const SizedBox(height: 8),
              Text(
                _formatDate(date),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).canvasColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }

  Future<void> _selectDate(BuildContext context, DateTime initialDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != date) {
      onDateChanged(picked);
    }
  }
}
