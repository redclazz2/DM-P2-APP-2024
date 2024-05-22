import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parcial_final/data/data_context.dart';

class ViewRegister extends StatelessWidget {
  final String deviceToken;
  
  final ImagePicker picker = ImagePicker();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController role = TextEditingController();

  final DataContext dataContext = DataContext();

  ViewRegister(this.deviceToken, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              "Register: Fill to create a user account", 
              style: Theme.of(context).textTheme.titleLarge,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    icon: const Icon(Icons.mail),
                    iconColor: Theme.of(context).colorScheme.surface,
                    label: Text(
                      "Email",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                    icon: const Icon(Icons.lock),
                    iconColor: Theme.of(context).colorScheme.surface,
                    label: Text(
                      "Password",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    icon: const Icon(Icons.text_fields),
                    iconColor: Theme.of(context).colorScheme.surface,
                    label: Text(
                      "Name",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: phone,
                decoration: InputDecoration(
                    icon: const Icon(Icons.cell_tower),
                    iconColor: Theme.of(context).colorScheme.surface,
                    label: Text(
                      "Phone",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: role,
                decoration: InputDecoration(
                    icon: const Icon(Icons.join_full),
                    iconColor: Theme.of(context).colorScheme.surface,
                    label: Text(
                      "Role",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    border: const OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
              onPressed:() async {
                var response = await dataContext.registerPerson(
                    email.text, password.text, name.text, phone.text, role.text, deviceToken);

                if(response.statusCode == 200){
                  
                }
              }, child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}