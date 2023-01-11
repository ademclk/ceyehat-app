import 'package:flutter/material.dart';

class FlightDetailView extends StatefulWidget {
  const FlightDetailView({super.key});

  @override
  State<FlightDetailView> createState() => _FlightDetailViewState();
}

class _FlightDetailViewState extends State<FlightDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1200"),
            ),
            const SizedBox(width: 10),
            Text("Adem Onur Çelik",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "SF Pro Display", color: Colors.white))
          ],
        ),
      ),
      body: Container(margin: const EdgeInsets.all(10)),
    );
  }
}
