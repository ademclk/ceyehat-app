import 'package:ceyehat_app/presentation/screens/flight/view/flight_detail_view.dart';
import 'package:flutter/material.dart';

class FlightListView extends StatefulWidget {
  const FlightListView({super.key});

  @override
  State<FlightListView> createState() => _FlightListViewState();
}

class _FlightListViewState extends State<FlightListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2, right: 2),
      child: ListTile(
        title: Text("ANKARA - İSTANBUL",
            style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        subtitle: Text(
          "12:00 - 16:00",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          "₺ 480",
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "SF Pro Display"),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FlightDetailView()));
        },
      ),
    );
  }
}
