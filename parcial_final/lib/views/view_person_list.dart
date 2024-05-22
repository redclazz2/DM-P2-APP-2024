import 'package:flutter/material.dart';
import 'package:parcial_final/data/data_context.dart';
import 'package:parcial_final/data/shared_context.dart';
import 'package:parcial_final/views/view_login.dart';
import 'package:parcial_final/widgets/widget_person_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPersonList extends StatelessWidget {
  final DataContext dataContext = DataContext();
  final SharedDataContext sharedContext = SharedDataContext();
  
  ViewPersonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
         actions: [
          ElevatedButton(
            onPressed: () async{
              SharedPreferences shared = await sharedContext.prefs;
              shared.clear();

              Navigator.pushReplacement(
                // ignore: use_build_context_synchronously
                context, 
                MaterialPageRoute(
                              builder: (context) => ViewLogin())
                );
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
