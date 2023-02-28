import 'package:flutter/material.dart';

class PassengerCard extends StatefulWidget {
  const PassengerCard({Key? key}) : super(key: key);

  @override
  _PassengerCardState createState() => _PassengerCardState();
}

class _PassengerCardState extends State<PassengerCard> {
  bool _showTypes = false;
  int _numPassengers = 1;
  int _numAdults = 1;
  int _numChildren = 0;
  int _numInfants = 0;

  void _updatePassengerCount() {
    setState(() {
      _numPassengers = _numAdults + _numChildren + _numInfants;
    });
  }

  void _incrementAdults() {
    setState(() {
      _numAdults++;
      _updatePassengerCount();
    });
  }

  void _decrementAdults() {
    setState(() {
      if (_numAdults > 0) {
        _numAdults--;
        _updatePassengerCount();
      }
    });
  }

  void _incrementChildren() {
    setState(() {
      _numChildren++;
      _updatePassengerCount();
    });
  }

  void _decrementChildren() {
    setState(() {
      if (_numChildren > 0) {
        _numChildren--;
        _updatePassengerCount();
      }
    });
  }

  void _incrementInfants() {
    setState(() {
      _numInfants++;
      _updatePassengerCount();
    });
  }

  void _decrementInfants() {
    setState(() {
      if (_numInfants > 0) {
        _numInfants--;
        _updatePassengerCount();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showTypes = !_showTypes;
        });
      },
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Passengers',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).canvasColor),
                  ),
                  Text(
                    '$_numPassengers',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              if (_showTypes) ...[
                SizedBox(height: 16),
                Text(
                  'Passenger Types',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                PassengerTypeCard(
                  title: 'Adults',
                  icon: Icons.person,
                  count: _numAdults,
                  increment: _incrementAdults,
                  decrement: _decrementAdults,
                ),
                PassengerTypeCard(
                  title: 'Children',
                  icon: Icons.child_friendly,
                  count: _numChildren,
                  increment: _incrementChildren,
                  decrement: _decrementChildren,
                ),
                PassengerTypeCard(
                  title: 'Infants',
                  icon: Icons.child_care,
                  count: _numInfants,
                  increment: _incrementInfants,
                  decrement: _decrementInfants,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class PassengerTypeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final int count;
  final VoidCallback increment;
  final VoidCallback decrement;

  const PassengerTypeCard({
    required this.title,
    required this.icon,
    required this.count,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: decrement,
            ),
            SizedBox(width: 8),
            Text(count.toString()),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: increment,
            ),
          ],
        ),
      ],
    );
  }
}

class PassengerTypeDescription extends StatelessWidget {
  final String title;
  final String description;

  const PassengerTypeDescription({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        Text(description),
      ],
    );
  }
}
