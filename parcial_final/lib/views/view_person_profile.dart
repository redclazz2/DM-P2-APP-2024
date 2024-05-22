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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 180,
              height: 180,
              child: Image.network(person.picture),
            ),
            Text(
              person.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              person.email,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              person.phone,
            ),
            Text(
              person.role,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("New Message"))
          ]),
        ),
      ),
    );
  }
}
