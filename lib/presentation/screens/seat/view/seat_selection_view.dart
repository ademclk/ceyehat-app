import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeatSelectionView extends StatefulWidget {
  const SeatSelectionView({super.key});

  @override
  State<SeatSelectionView> createState() => _SeatSelectionViewState();
}

class _SeatSelectionViewState extends State<SeatSelectionView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SeatSelectionNotifier(),
      child: Container(
        margin: const EdgeInsets.only(left: 2, right: 2),
        child: GridView.count(
          crossAxisCount: 3, // Number of columns
          children: List.generate(loadSeats().length, (index) {
            Seat seat = loadSeats()[index];
            return SeatWidget(seat: seat);
          }),
        ),
      ),
    );
  }
}

class SeatWidget extends StatefulWidget {
  final Seat? seat;

  SeatWidget({this.seat});

  @override
  _SeatWidgetState createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      if (widget.seat!.isAvailable) {
        final notifier = Provider.of<SeatSelectionNotifier>(context, listen: false);
        notifier.toggleSeat(widget.seat!);
      }
    },
    child: Column(
      children: [
        Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: widget.seat!.isAvailable
                ? (Provider.of<SeatSelectionNotifier>(context).selectedSeats.contains(widget.seat)
                ? Colors.lightBlue
                : Colors.white)
                : Colors.grey,
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          child: Center(
            child: Text(
              widget.seat!.number,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ),
      ],
    ),
    );
  }
}

class Seat {
  String number;
  bool isAvailable;

  Seat({required this.number, required this.isAvailable});
}

List<Seat> loadSeats() {
  // Load the seat data from some source
  return [
  Seat(number: 'A1', isAvailable: true),
  Seat(number: 'A2', isAvailable: true),
  Seat(number: 'A3', isAvailable: true),
  Seat(number: 'A4', isAvailable: true),
  Seat(number: 'A5', isAvailable: true),
  Seat(number: 'A6', isAvailable: true),
  Seat(number: 'B1', isAvailable: true),
  Seat(number: 'B2', isAvailable: true),
  Seat(number: 'B3', isAvailable: true),
  Seat(number: 'B4', isAvailable: true),
  Seat(number: 'B5', isAvailable: false),
  Seat(number: 'B6', isAvailable: true),
  Seat(number: 'C1', isAvailable: true),
  Seat(number: 'C2', isAvailable: true),
  Seat(number: 'C3', isAvailable: true),
  Seat(number: 'C4', isAvailable: true),
  Seat(number: 'C5', isAvailable: false),
  Seat(number: 'C6', isAvailable: true),
  ];
}

class SeatSelectionNotifier extends ChangeNotifier {
  final Set<Seat> _selectedSeats = Set();

  Set<Seat> get selectedSeats => _selectedSeats;

  void toggleSeat(Seat seat) {
    if (_selectedSeats.contains(seat)) {
      _selectedSeats.remove(seat);
    } else {
      _selectedSeats.add(seat);
    }
    notifyListeners();
  }
}


