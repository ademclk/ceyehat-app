import 'package:flutter/material.dart';

class SeatSelectionView extends StatefulWidget {
  const SeatSelectionView({super.key});

  @override
  State<SeatSelectionView> createState() => _SeatSelectionViewState();
}

class _SeatSelectionViewState extends State<SeatSelectionView> {
  @override
  Widget build(BuildContext context) {
    List<Seat> seats = loadSeats();
    return Container(
      margin: const EdgeInsets.only(left: 2, right: 2),
      child: GridView.count(
        crossAxisCount: 3, // Number of columns
        children: List.generate(seats.length, (index) {
          Seat seat = seats[index];
          return SeatWidget(seat: seat);
        }),
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
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.seat?.isAvailable ?? true) {
          setState(() {
            isSelected = !isSelected;
          });
        }
      },
      child: Column(
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: widget.seat?.isAvailable ?? true
                  ? (isSelected ? Colors.lightBlue : Colors.white)
                  : Colors.grey,
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: Center(
              child: Text(
                widget.seat?.number ?? "",
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
  String? number;
  bool? isAvailable;

  Seat({this.number, this.isAvailable});
}

List<Seat> loadSeats() {
  // Load the seat data from some source
  return [
    Seat(number: 'A1', isAvailable: true),
    Seat(number: 'A2', isAvailable: true),
    Seat(number: 'A3', isAvailable: false),
    Seat(number: 'A4', isAvailable: true),
    Seat(number: 'A5', isAvailable: true),
    Seat(number: 'A6', isAvailable: false),
    Seat(number: 'B1', isAvailable: true),
    Seat(number: 'B2', isAvailable: false),
    Seat(number: 'B3', isAvailable: true),
    Seat(number: 'B4', isAvailable: true),
    Seat(number: 'B5', isAvailable: false),
    Seat(number: 'B6', isAvailable: false),
    Seat(number: 'C1', isAvailable: true),
    Seat(number: 'C2', isAvailable: false),
    Seat(number: 'C3', isAvailable: true),
    Seat(number: 'C4', isAvailable: true),
    Seat(number: 'C5', isAvailable: false),
    Seat(number: 'C6', isAvailable: true),
  ];
}
