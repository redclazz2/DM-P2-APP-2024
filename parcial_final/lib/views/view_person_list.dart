import 'package:flutter/material.dart';
import 'package:parcial_final/data/data_context.dart';
import 'package:parcial_final/widgets/widget_person_list.dart';

class ViewPersonList extends StatelessWidget {
  final DataContext dataContext = DataContext();

  ViewPersonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
         actions: [
          ElevatedButton(
            onPressed: () {
              
            },
            child: Icon(
              Icons.exit_to_app_outlined,
              color: Theme.of(context).colorScheme.onError,
            ),
          ),]
      ),
      body: FutureBuilder(
          future: dataContext.getPersons(),
          builder: (context, snapshot) => snapshot.hasData
              ? ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, index) =>
                      WidgetPersonList(person: snapshot.data![index]))
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
