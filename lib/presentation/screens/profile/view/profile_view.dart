import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1200"),
              ),
              const SizedBox(width: 10),
              Text("Adem Onur Çelik",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SF Pro Display",
                      color: Colors.white))
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.separated(
              itemCount: 8,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text('Uçuş'),
                  subtitle: Text('Uçuş detayları'),
                  trailing: Icon(Icons.flight),
                );
              },
            ))
          ],
        ));
  }
}
