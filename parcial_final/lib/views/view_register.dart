import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parcial_final/data/data_context.dart';
import 'package:parcial_final/data/shared_context.dart';
import 'package:parcial_final/views/view_person_list.dart';
import 'package:parcial_final/widgets/widget_image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewRegister extends StatelessWidget {
  final String deviceToken;

  final ImagePicker picker = ImagePicker();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController role = TextEditingController();

  final DataContext dataContext = DataContext();
  final SharedDataContext sharedContext = SharedDataContext();

  final WidgetImagePicker imagePicker = const WidgetImagePicker();

  ViewRegister(this.deviceToken, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Register: Fill to create a user account",
                style: Theme.of(context).textTheme.titleLarge,
              ),
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
                  obscureText: true,
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
              imagePicker,
              ElevatedButton(
                  onPressed: () async {
                    var response = await dataContext.registerPerson(
                        email.text,
                        password.text,
                        name.text,
                        phone.text,
                        role.text,
                        deviceToken);

                    if (response.statusCode == 200) {
                      SharedPreferences shared = await sharedContext.prefs;
                      shared.setString("AuthToken", response.body);
                      shared.setString("AuthEmail", email.text);

                      if (shared.getString("selectedImage") != null) {
                        await dataContext.uploadImage();
                      }
                      if (context.mounted) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewPersonList()));
                      }
                    }
                  },
                  child: const Text("Register"))
            ],
          ),
        ),
      ),
    );
  }
}
