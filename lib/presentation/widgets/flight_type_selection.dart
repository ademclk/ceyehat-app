import 'package:flutter/material.dart';

class FlightTypeSelection extends StatelessWidget {
  final int? selectedOption;
  final Function(int) onOptionChanged;

  const FlightTypeSelection({
    super.key,
    required this.selectedOption,
    required this.onOptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.primary,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'CHOOSE YOUR FLIGHT',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      onOptionChanged(0);
                    },
                    child: Text(
                      'One-way',
                      style: TextStyle(
                        color: selectedOption == 0
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                        fontWeight: selectedOption == 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onOptionChanged(1);
                    },
                    child: Text(
                      'Round-trip',
                      style: TextStyle(
                        color: selectedOption == 1
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                        fontWeight: selectedOption == 1
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onOptionChanged(2);
                    },
                    child: Text(
                      'Multi-city',
                      style: TextStyle(
                        color: selectedOption == 2
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                        fontWeight: selectedOption == 2
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
