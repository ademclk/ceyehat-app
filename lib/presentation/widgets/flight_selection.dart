import 'package:flutter/material.dart';

class FlightSelection extends StatelessWidget {
  final String? airport;
  final String? airportAbbreviation;
  final String label;
  final VoidCallback onTap;

  const FlightSelection({
    Key? key,
    required this.label,
    required this.onTap,
    this.airport,
    this.airportAbbreviation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.42,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).canvasColor),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(airportAbbreviation == null ? '' : airportAbbreviation!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).canvasColor)),
              const SizedBox(
                height: 8,
              ),
              Text(airport == null ? '' : airport!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).canvasColor)),
            ],
          ),
        ),
      ),
    );
  }
}
