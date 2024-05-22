import 'package:flutter/material.dart';
import 'package:parcial_final/data/data_context.dart';
import 'package:parcial_final/models/person.dart';

class ViewPersonProfile extends StatelessWidget {
  final Person person;
  final TextEditingController title = TextEditingController();
  final TextEditingController body = TextEditingController();
  final DataContext dataContext = DataContext();

  ViewPersonProfile({required this.person, super.key});

  void showMessageModal(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        builder: ((context) {
          return 
          Padding(
            padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              height: 380,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: title,
                      autofocus: true,
                      decoration: InputDecoration(
                          label: Text(
                            "Message Title",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: body,
                      decoration: InputDecoration(
                          label: Text(
                            "Message Body",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                  ElevatedButton(onPressed: (){ 
                    dataContext.sendMessage(person.email, title.text, body.text);
                    Navigator.pop(context); 
                    }, child: const Text("Send"))
                ],
              )),
            ),
          );
        }));
  }

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
            ElevatedButton(
                onPressed: () {
                  showMessageModal(context);
                },
                child: const Text("New Message"))
          ]),
        ),
      ),
    );
  }
}
