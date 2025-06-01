import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RecordDropDown extends StatelessWidget {
  final String label;
  final String selectedValue;
  final List<String> options;
  final void Function(String) onChanged;
  const RecordDropDown({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ShadSelect(
                initialValue: selectedValue,
                selectedOptionBuilder: (context, value) {
                  return Text(selectedValue);
                },
                options: options.map((option) => Text(option)).toList(),
                onChanged: (value) {
                  if (value != null) onChanged(value);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
