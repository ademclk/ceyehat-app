import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              labelText: 'Kalkış',
            ),
          ),
          Padding(padding: EdgeInsets.all(8.0)),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              labelText: 'Varış',
            ),
          ),
          Padding(padding: EdgeInsets.all(8.0)),
        ],
      ),
    );
  }
}
