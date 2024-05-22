import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:parcial_final/data/data_context.dart';
import 'package:parcial_final/data/shared_context.dart';
import 'package:parcial_final/views/view_person_list.dart';
import 'package:parcial_final/views/view_register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewLogin extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final DataContext dataContext = DataContext();
  final SharedDataContext sharedContext = SharedDataContext();

  Future<String> askForNotificationPermitions() async {
    final notificationSettings = await FirebaseMessaging.instance
        .requestPermission(
            alert: true, announcement: true, badge: true, provisional: true);

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      final token = await FirebaseMessaging.instance.getToken();

      print("Device Token: $token");
      if (token != null) {
        return token;
      }
    }

    return "";
  }

  ViewLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                textAlign: TextAlign.center,
                "Mobile Development Final: Push Notifications",
                style: Theme.of(context).textTheme.titleLarge,
              ),
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
            ElevatedButton(
                onPressed: () async {
                  String authorized = await askForNotificationPermitions();
                  if (authorized != "") {
                    var response = await dataContext.loginUser(
                        authorized, email.text, password.text);

                    if (response.statusCode == 200) {
                      SharedPreferences shared = await sharedContext.prefs;
                      shared.setString("AuthToken", response.body);

                      Navigator.pushReplacement(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewPersonList()));
                    }
                  }
                },
                child: const Text("Login")),
            ElevatedButton(
                onPressed: () async {
                  String authorized = await askForNotificationPermitions();
                  if (authorized != "") {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ViewRegister(authorized))));
                  }
                },
                child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}
