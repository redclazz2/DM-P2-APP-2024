import 'package:flutter/material.dart';
import 'package:parcial_final/models/person.dart';
import 'package:parcial_final/views/view_person_profile.dart';

class WidgetPersonList extends StatelessWidget {
  final Person person;

  const WidgetPersonList({required this.person, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => ViewPersonProfile(
                      person: person,
                    ))));
      },
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(1),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(person.picture),
                  ),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            person.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            person.email,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    )
                  ])
                ]),
              ))
        ],
      ),
    );
  }
}
