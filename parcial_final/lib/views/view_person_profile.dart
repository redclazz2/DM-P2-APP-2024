import 'package:flutter/material.dart';
import 'package:parcial_final/models/person.dart';

class ViewPersonProfile extends StatelessWidget {
  final Person person;

  const ViewPersonProfile({required this.person, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User Profile"),
        ),
        body: Center(
          child: Column(children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image.network(person.picture),
            ),
            Text(
              person.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              person.email,
            ),
            Text(
              person.phone,
            ),
            Text(
              person.role,
            ),
          ]),
        ),
      ),
    );
  }
}
