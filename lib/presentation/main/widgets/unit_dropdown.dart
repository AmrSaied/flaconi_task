import 'package:flutter/material.dart';

class UnitsDropDown extends StatelessWidget {
  final void Function(String?) onChanged;
  final String? value;
  const UnitsDropDown({
    super.key,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8,
      ),
      child: Row(
        children: [
          const Text(
            'Unit: ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          DropdownButton<String>(
            items: const [
              DropdownMenuItem<String>(
                value: 'c',
                child: Text(
                  '°C',
                ),
              ),
              DropdownMenuItem<String>(
                value: 'f',
                child: Text(
                  '°F',
                ),
              ),
            ],
            onChanged: onChanged,
            value: value,
          ),
        ],
      ),
    );
  }
}
